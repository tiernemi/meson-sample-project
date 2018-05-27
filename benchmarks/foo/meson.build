foobenchmark_sources = [
    'foobenchmark.cc'
]

foobenchmark_deps = [

]

foobenchmark_lib_deps = [
    foo_lib
]

foobenchmark = executable('foobenchmark', 
    [foobenchmark_sources,benchmark_main], 
    include_directories : inc,
    dependencies : [foobenchmark_deps,benchmark_deps], 
    link_with : [foobenchmark_lib_deps, benchmark_dep_libs])

benchmark('foo benchmark', foobenchmark)

all_benchmark_deps += foobenchmark_deps
all_benchmark_dep_libs += foobenchmark_lib_deps
project_benchmark_sources += files(foobenchmark_sources)