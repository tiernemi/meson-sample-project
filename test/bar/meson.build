# This is for the individual tests
bartest = executable('bartest', ['bartest.cpp', tests_main], include_directories : inc, dependencies : gtest_dep, link_with : bar_lib)
test('Bartest', bartest)

# This for the all_tests executable
bar_test_lib = static_library('bartest',
                        'bartest.cpp',
                        dependencies : gtest_dep,
                        include_directories : inc,
                        link_with : bar_lib
                        )
all_static_test_libs += bar_test_lib
all_test_sources += files('bartest.cpp')