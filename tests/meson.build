all_test_deps = []
all_test_dep_libs = []
project_test_sources = []

gtest_dep = dependency('gtest')
thread_dep = dependency('threads')
test_main = files('tests_main.cc')

test_deps = [
    gtest_dep, 
    thread_dep
]

test_dep_libs = [

]

subdir('foo')
subdir('bar')

# This executable contains all the tests
project_test_sources += test_main
all_test_deps += test_deps
all_test_dep_libs += test_dep_libs

all_testes = executable('all_tests', 
    project_test_sources, 
    include_directories : inc, 
    dependencies : all_test_deps, 
    link_with : all_test_dep_libs)