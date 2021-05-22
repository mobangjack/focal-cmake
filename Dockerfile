FROM ubuntu:20.04 AS focal-cmake

RUN apt-get update && apt-get install -y \
    wget

ARG CMAKE_VERSION=3.20.2
RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz
RUN tar xf cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz -C /
RUN echo "export PATH=/cmake-${CMAKE_VERSION}-linux-x86_64/bin:\${PATH}" >> /etc/bash.bashrc
RUN rm cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz
