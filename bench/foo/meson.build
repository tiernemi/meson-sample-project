foobench = executable('foobench', ['foobench.cpp', benches_main], include_directories : inc, dependencies : [gbench_dep,thread_dep], link_with : foo_lib)
benchmark('foo benchmark', foobench)

# This for the all_benchs executable
foo_bench_lib = static_library('foobench',
                        'foobench.cpp',
                        dependencies : gbench_dep,
                        include_directories : inc,
                        link_with : foo_lib)
all_static_bench_libs += foo_bench_lib 
all_bench_sources += files('foobench.cpp')