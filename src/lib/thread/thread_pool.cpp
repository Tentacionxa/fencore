#include "pch.hpp"
#include "lib/thread/thread_pool.hpp"
#include "lib/logging/logger.hpp"

// Concrete implementation of Logger
class ConcreteLogger : public Logger {
public:
    void setLevel(const std::string& name) override {
        // Implementation
    }

    std::string getLevel() const override {
        // Implementation
        return "info";
    }

    void log(const std::string& lvl, fmt::basic_string_view<char> msg) const override {
        // Implementation
        spdlog::info("[{}] {}", lvl, msg);
    }
};

// Create a concrete instance of Logger
ConcreteLogger globalLogger;

// Define the global thread pool using the concrete logger
ThreadPool threadPool(globalLogger);

ThreadPool::ThreadPool(Logger &logger) :
    BS::thread_pool(std::max<int>(getNumberOfCores(), DEFAULT_NUMBER_OF_THREADS)), logger(logger) {
    start();
}

void ThreadPool::start() {
    logger.info("Running with {} threads.", get_thread_count());
}

void ThreadPool::shutdown() {
    logger.info("Shutting down thread pool...");
    stopped = true;
    wait();
}
