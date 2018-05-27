#include "benchmark/benchmark.h"
#include "foo/foo.h"

static void BM_FOO(benchmark::State &state) {
  for (auto _ : state) foo(1);
}
// Register the function as a benchmark
BENCHMARK(BM_FOO);