FROM ubuntu:20.04

# required args, see README
ARG user
ARG userid
RUN test -n "$user"
RUN test -n "$userid"

RUN apt update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
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
    graphviz \
    python3 \
    clang-10 \
    clang-format-10 \
    clang-tidy-10 \ 
    cmake \
    python3-pip

# get pip
RUN pip3 install ninja meson gcovr

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

ENV PATH="${PATH}:/usr/lib/llvm-10/bin/"
ENV PATH="${PATH}:/usr/lib/llvm-10/share/clang"
RUN sed -i 's/subprocess.call(invocation)/subprocess.call(invocation, cwd=args.build_path)/g' /usr/lib/llvm-10/share/clang/run-clang-tidy.py

WORKDIR /code

# add same user
RUN groupadd -r $user && useradd -r -u $userid -g $user $user
USER $user