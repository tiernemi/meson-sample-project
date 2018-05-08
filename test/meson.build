all_static_test_libs = []

gtest_dep = dependency('gtest')
tests_main = files('tests_main.cpp')

subdir('foo')
subdir('bar')

# This executable contains all the tests
all_test_sources += tests_main
all_tests = executable('all_tests', all_test_sources, include_directories : inc, dependencies : gtest_dep, link_with : all_static_test_libs)