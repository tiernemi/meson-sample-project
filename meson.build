project('sample_cpp_project', 'cpp',
    version : '1.0',
    license : [ 'proprietary'],
    meson_version : '>= 0.40.1',
    default_options : [ 'warning_level=3', 'buildtype=debugoptimized', 'cpp_std=c++11' ]
)

# Variables tracking sources and libraries
all_sources = []
all_static_libs = []
all_header_files = []
all_test_sources = []
all_bench_sources = []

# This is where you should add in include directories
inc = include_directories('include')

# This triggers the builds of sources
subdir('src')
# This links all the static libs into the main source file to form a binary
sample_cpp_project_bin = executable('sample_cpp_project_bin', main_source, include_directories : inc, link_with : all_static_libs)

subdir('test')
subdir('bench')
subdir('doc')

# This adds the clang format file to the build directory
configure_file(input : '.clang-format',
               output : '.clang-format',
               configuration : configuration_data())
run_target('format',
  command : ['clang-format','-i','-style=file',all_sources,all_test_sources,all_bench_sources,all_header_files])

# This adds clang tidy support
configure_file(input : '.clang-tidy',
               output : '.clang-tidy',
               configuration : configuration_data())
run_target('tidy',
  command : ['clang-tidy','-fix', all_sources, all_header_files])
