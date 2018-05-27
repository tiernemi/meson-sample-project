barbenchmark_sources = [
    'barbenchmark.cc'
]

barbenchmark_deps = [

]

barbenchmark_lib_deps = [
    bar_lib
]

barbenchmark = executable('barbenchmark', 
    [barbenchmark_sources, benchmark_main], 
    include_directories : inc,
    dependencies : [barbenchmark_deps,benchmark_deps], 
    link_with : [barbenchmark_lib_deps, benchmark_dep_libs])

benchmark('bar benchmark', barbenchmark)

all_benchmark_deps += barbenchmark_deps
all_benchmark_dep_libs += barbenchmark_lib_deps
project_benchmark_sources += files(barbenchmark_sources)