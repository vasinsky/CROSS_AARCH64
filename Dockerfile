FROM arm64v8/debian:bullseye-slim

WORKDIR /build

RUN apt-get update && \
    apt-get install -y \
        bash \
        gcc \
        g++ \
        make \
        curl \
        wget \
        build-essential \
        libc6-dev \
        libncurses5-dev \
        bison \
        gawk \
        python3 \
        python3-dev \
        ca-certificates && \
    apt-get clean

RUN curl -LO https://ftp.gnu.org/gnu/libc/glibc-2.38.tar.gz && \
    tar -xvzf glibc-2.38.tar.gz && \
    cd glibc-2.38 && \
    mkdir build && \
    cd build && \
    ../configure --prefix=/opt/glibc-2.38 && \
    make -j$(nproc) && \
    make install

ENV LD_LIBRARY_PATH=/opt/glibc-2.38/lib

RUN /opt/glibc-2.38/lib/ld-2.38.so --library-path /opt/glibc-2.38/lib /opt/glibc-2.38/lib/ld-2.38.so --version

WORKDIR /workspace
