#include "bar/bar.hpp"
#include "benchmark/benchmark.h"

static void BM_bar(benchmark::State &state) {
  for (auto _ : state) {
    bar(1);
  }
}
// Register the function as a benchmark
BENCHMARK(BM_bar);