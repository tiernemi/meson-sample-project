all_benchmark_deps = []
all_benchmark_dep_libs = []
all_benchmark_sources = []

gbenchmark_dep = dependency('benchmark')
thread_dep = dependency('threads')
benchmark_main = files('benchmarks_main.cc')

benchmark_deps = [
    gbenchmark_dep, 
    thread_dep
]

benchmark_dep_libs = [

]

subdir('foo')
subdir('bar')

# This executable contains all the benchmarks
all_benchmark_sources += benchmark_main
all_benchmark_deps += benchmark_deps
all_benchmark_dep_libs += benchmark_dep_libs

all_benchmarkes = executable('all_benchmarks', 
    all_benchmark_sources, 
    include_directories : inc, 
    dependencies : all_benchmark_deps, 
    link_with : all_benchmark_dep_libs)