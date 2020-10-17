## Meson Sample Project

This sample project uses meson to manage builds and already has auto-formatting, testing, linting, benchmarking, code coverage, static analysis and documentation generation.

Once the project structure follows the same general directory structure there should be minimum changes required to start a new cpp project capable of using these tools out of the box.

* **src** : Contains the project source files.
* **include** : Contains the project header files.
* **tests** : Contains unit tests for project functions + classes.
* **benchmarks** :  Contains micro benchmarks for project functions + classes.
* **docs** : Contains the doxygen config file used to generate the documentation.
* **third_party** : Contains the third_party sources and libs. These are ignored for formatting + linting + documentation purposes.

### Dependencies (all contained with the Docker container)

* benchmark
* build-essential
* clang-6.0 
* clang-format-6.0
* clang-tidy-6.0
* curl
* dot
* doxygen
* gcovr
* gdb
* git
* graphviz
* gtest
* libgtest-dev
* meson-0.46
* ninja
* pip3
* python3.6
* software-properties-common
* valgrind
* wget


### [OPTIONAL] Launch The Build Container

In order to avoid costly build environment setup times you can run the builds in a docker container. To launch the build_env it run the following commands.

```bash
docker build . -t build_env --build-arg user=$USER --build-arg userid=$UID
docker run -it -v $(pwd):/code  -e USER=$USER -e USERID=$UID build_env bash
```
You can now run builds from this container. The source code from your local directory will be in the container in the `/code/` directory.

### Building The Sample Application

The project build directory is created using the following command.
```bash
meson build
```

Builds can be triggered using ninja once inside this build directory.
```bash
ninja
```

### Running Tests

Benchmarks require an installed [googletest](https://github.com/google/googletest)
Tests are created using googletest and can be run using ninja once inside the build directory.

```bash
ninja test
```

To run tests with address sanitization, build meson with this command.

```
meson build -Db_sanitize=address
cd build
ninja
ninja test
```

### Wrapping Tests With Valgrind

Meson has the ability to wrap the tests in valgrind. This is useful for spotting easily avoidable memory leaks. From within the build directory run

```bash
meson test --wrap='valgrind --tool=helgrind'
```

### Wrapping Tests With GDB

Meson has the ability to wrap the tests in gdb. This is useful for debugging. From within the build directory run

```bash
meson test --gdb
```

### Running Benchmarks

Benchmarks require an installed [benchmark](https://github.com/google/benchmark)
Benchmarks are created using google's benchmark library and can be run using ninja once inside the build directory.

```bash
ninja benchmark
```

### Formatting

To format you simply run the following command in the build directory.

```bash
ninja format
```

### Tidying

There is a linter integrated into this project which enforces various style choices. This will automatically fix your code to align with these standards. It will also display issues that can't be autofixed.

```bash
ninja tidy
```

### Creating Documentation

Documentation generation requires [doxygen](https://github.com/doxygen/doxygen)
Documentation is created using doxygen. These can be generated using ninja once inside the build directory.

```bash
ninja doc
```

### Creating Coverage Reports

Coverage reports require gcov.
The build directory can be configured to generate coverage as follows.

```bash
 meson build_coverage -Db_coverage=true
```
Coverage can then be generated as follows.

```bash
ninja
ninja test
ninja coverage-html
```
### Running Static Analysis

Static analysis requires clang.
Running static analysis is as simple as running the following command from the build directory.

```bash
ninja scan-build
```

### Running The Application

The application can be run as follows.

```bash
./sample_cpp_application_bin
```
