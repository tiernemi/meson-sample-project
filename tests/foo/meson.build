footest_sources = [
    'footest.cc'
]

footest_deps = [

]

footest_lib_deps = [
    foo_lib
]

footest = executable('footest', 
    [footest_sources, test_main], 
    include_directories : inc,
    dependencies : [footest_deps,test_deps], 
    link_with : [footest_lib_deps, test_dep_libs])

test('foo test', footest)

all_test_deps += footest_deps
all_test_dep_libs += footest_lib_deps
project_benchmark_sources += files(footest_sources)