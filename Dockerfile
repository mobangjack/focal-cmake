FROM ubuntu:20.04 AS focal-cmake

RUN apt-get update && apt-get install -y \
    wget

ARG CMAKE_VERSION=3.20.2
RUN wget -q -nv https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz
RUN tar xf cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz -C /
RUN rm cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz
ENV CMAKE_HOME=/cmake-${CMAKE_VERSION}-linux-x86_64
RUN ln -s $CMAKE_HOME /cmake
RUN echo "export PATH=${CMAKE_HOME}/bin:\${PATH}" >> /etc/bash.bashrc
