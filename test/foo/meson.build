# This is for the individual tests
footest = executable('footest', ['footest.cpp', tests_main], include_directories : inc, dependencies : gtest_dep, link_with : foo_lib)
test('Footest', footest)

# This for the all_tests executable
foo_test_lib = static_library('footest',
                        'footest.cpp',
                        dependencies : gtest_dep,
                        include_directories : inc,
                        link_with : foo_lib)
all_static_test_libs += foo_test_lib 
all_test_sources += files('footest.cpp')