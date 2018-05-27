bartest_sources = [
    'bartest.cc'
]

bartest_deps = [

]

bartest_lib_deps = [
    bar_lib
]

bartest = executable('bartest', 
    [bartest_sources, test_main], 
    include_directories : inc,
    dependencies : [bartest_deps,test_deps], 
    link_with : [bartest_lib_deps, test_dep_libs])

test('bar test', bartest)

all_test_deps += bartest_deps
all_test_dep_libs += bartest_lib_deps
project_benchmark_sources += files(bartest_sources)