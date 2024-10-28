
#pragma once

#include <memory_resource>  // Include for std::pmr
#include <atomic_queue/atomic_queue.h>  // Include for atomic_queue

constexpr size_t STATIC_PREALLOCATION_SIZE = 500;

template <typename T, size_t CAPACITY>
struct LockfreeFreeList {
    using FreeList = atomic_queue::AtomicQueue2<T*, CAPACITY>;

    static FreeList &get() {
        static FreeList freeList;
        return freeList;
    }

    static void preallocate(size_t count, std::pmr::memory_resource* resource = std::pmr::get_default_resource()) {
        auto &freeList = get();
        for (size_t i = 0; i < count; ++i) {
            T* p = static_cast<T*>(resource->allocate(sizeof(T), alignof(T)));
            if (!freeList.try_push(p)) {
                resource->deallocate(p, sizeof(T), alignof(T));
                break;
            }
        }
    }
};

template <typename T, size_t CAPACITY>
class LockfreePoolingAllocator final : public std::pmr::memory_resource {
public:
    using value_type = T;

    template <typename U>
    struct rebind {
        using other = LockfreePoolingAllocator<U, CAPACITY>;
    };

    LockfreePoolingAllocator() noexcept {
        std::call_once(preallocationFlag, []() {
            LockfreeFreeList<T, CAPACITY>::preallocate(STATIC_PREALLOCATION_SIZE);
        });
    }

    template <typename U>
    explicit LockfreePoolingAllocator(const LockfreePoolingAllocator<U, CAPACITY>&) noexcept {
        std::call_once(preallocationFlag, []() {
            LockfreeFreeList<T, CAPACITY>::preallocate(STATIC_PREALLOCATION_SIZE);
        });
    }

    ~LockfreePoolingAllocator() override = default;

    T* allocate(std::size_t n) noexcept {
        if (n == 1) {
            T* p;
            if (LockfreeFreeList<T, CAPACITY>::get().try_pop(p)) {
                return p;
            }
        }
        return static_cast<T*>(::operator new(n * sizeof(T), static_cast<std::align_val_t>(alignof(T))));
    }

    void deallocate(T* p, std::size_t n) noexcept {
        if (n == 1) {
            if (LockfreeFreeList<T, CAPACITY>::get().try_push(p)) {
                return;
            }
        }
        ::operator delete(p, static_cast<std::align_val_t>(alignof(T)));
    }

protected:
    void* do_allocate(std::size_t bytes, std::size_t alignment) noexcept override {
        return static_cast<void*>(this->allocate(bytes / sizeof(T)));
    }

    void do_deallocate(void* p, std::size_t bytes, std::size_t alignment) noexcept override {
        this->deallocate(static_cast<T*>(p), bytes / sizeof(T));
    }

    bool do_is_equal(const std::pmr::memory_resource& other) const noexcept override {
        return this == &other;
    }

private:
    static std::once_flag preallocationFlag;
};

template <typename T, size_t CAPACITY>
std::once_flag LockfreePoolingAllocator<T, CAPACITY>::preallocationFlag;
