FROM ubuntu:16.04

# required args, see README
ARG user
ARG userid
RUN test -n "$user"
RUN test -n "$userid"

RUN apt update
RUN apt -y install \
    build-essential \
    curl \
    git \
    libgtest-dev \
    software-properties-common \
    valgrind \
    wget \
    pkg-config \
    doxygen \
    graphviz


# add python 3.6
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt update && \
    apt -y install python3.6

# add clang 6
RUN echo "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main" > /etc/apt/sources.list.d/llvm.list && \
    wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    apt update && \
    apt -y install clang-6.0 clang-format-6.0 clang-tidy-6.0
ENV PATH="${PATH}:/usr/lib/llvm-6.0/bin/"
# Reconcile ninja relative paths with clang-tidy ugh!
ENV PATH="${PATH}:/usr/lib/llvm-6.0/share/clang"
RUN sed -i 's/subprocess.call(invocation)/subprocess.call(invocation, cwd=args.build_path)/g' /usr/lib/llvm-6.0/share/clang/run-clang-tidy.py

# get pip
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3 && \
    pip3 install ninja meson

# install cmake
WORKDIR /opt/cmake
RUN wget https://cmake.org/files/v3.11/cmake-3.11.1-Linux-x86_64.sh && \
    sh cmake-3.11.1-Linux-x86_64.sh --prefix=/opt/cmake --skip-license && \
    ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake && \
    rm cmake-3.11.1-Linux-x86_64.sh

# install google benchmark
WORKDIR /root/Downloads
RUN cd /root/Downloads && \
    git clone --depth 1 --single-branch https://github.com/google/benchmark.git && \
    mkdir benchmark/build && \
    cd benchmark/build && \
    cmake .. -DCMAKE_BUILD_TYPE=RELEASE -DBENCHMARK_ENABLE_GTEST_TESTS=OFF && \
    make -j 8 && \
    make install && \
    rm -rf /root/Downloads/benchmark

WORKDIR /code

# add same user
RUN groupadd -r $user && useradd -r -u $userid -g $user $user
USER $user