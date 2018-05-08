barbench = executable('barbench', ['barbench.cpp', benches_main], include_directories : inc, dependencies : [gbench_dep,thread_dep], link_with : bar_lib)
benchmark('bar benchmark', barbench)

# This for the all_benchs executable
bar_bench_lib = static_library('barbench',
                        'barbench.cpp',
                        dependencies : gbench_dep,
                        include_directories : inc,
                        link_with : bar_lib)
all_static_bench_libs += bar_bench_lib 
all_bench_sources += files('barbench.cpp')