/**
 * Canary - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/opentibiabr/canary
 * License: https://github.com/opentibiabr/canary/blob/main/LICENSE
 * Contributors: https://github.com/opentibiabr/canary/graphs/contributors
 * Website: https://docs.opentibiabr.com/
 */

#pragma once
#ifndef THREAD_POOL_HPP
#define THREAD_POOL_HPP

#include "lib/logging/logger.hpp"
#include "BS_thread_pool.hpp"
#include <mutex>
#include <condition_variable>
#include <queue>
#include <functional>
#include <atomic>

extern ThreadPool threadPool;

class ThreadPool : public BS::thread_pool {
public:
    explicit ThreadPool(Logger &logger);

    // Ensure we don't accidentally copy it
    ThreadPool(const ThreadPool &) = delete;
    ThreadPool operator=(const ThreadPool &) = delete;

    void start();
    void shutdown();

    static int16_t getThreadId() {
        static std::atomic_int16_t lastId = -1;
        thread_local static int16_t id = -1;

        if (id == -1) {
            lastId.fetch_add(1);
            id = lastId.load();
        }

        return id;
    }

    template <class F>
    void submit(F&& task) {
        {
            std::unique_lock<std::mutex> lock(queueMutex);
            tasks.emplace(std::forward<F>(task));
        }
        condition.notify_one();
    }

    bool isStopped() const {
        return stopped;
    }

private:
    Logger &logger;
    bool stopped = false;
    std::mutex queueMutex;
    std::condition_variable condition;
    std::queue<std::function<void()>> tasks;
};

#endif // THREAD_POOL_HPP
