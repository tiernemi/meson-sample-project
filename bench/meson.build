all_static_bench_libs = []

gbench_dep = dependency('benchmark')
thread_dep = dependency('threads')
benches_main = files('benches_main.cpp')

subdir('foo')
subdir('bar')

# This executable contains all the benchs
all_bench_sources += benches_main
all_benches = executable('all_benches', all_bench_sources, include_directories : inc, dependencies : [gbench_dep, thread_dep], link_with : all_static_bench_libs)