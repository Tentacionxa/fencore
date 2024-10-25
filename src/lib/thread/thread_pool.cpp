/**
 * Canary - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/opentibiabr/canary
 * License: https://github.com/opentibiabr/canary/blob/main/LICENSE
 * Contributors: https://github.com/opentibiabr/canary/graphs/contributors
 * Website: https://docs.opentibiabr.com/
 */

#include "pch.hpp"
#include "lib/thread/thread_pool.hpp"
#include "lib/logging/logger.hpp"
#include "game/game.hpp"
#include "utils/tools.hpp"

// Global Logger instance for the application
Logger globalLogger;

// Global ThreadPool instance using the global logger
ThreadPool threadPool(globalLogger);

/**
 * Regardless of how many cores your computer has, we want at least
 * 4 threads because, even though they won't improve processing, they
 * will make processing non-blocking, allowing single-core computers
 * to process things concurrently, albeit not in parallel.
 */
#ifndef DEFAULT_NUMBER_OF_THREADS
    #define DEFAULT_NUMBER_OF_THREADS 4
#endif

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
