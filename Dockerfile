FROM python:3.12-slim

COPY . /llvm/src

RUN apt-get update 
RUN apt-get install -y build-essential cmake ninja-build git
RUN mkdir /llvm/build && cd /llvm/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang-tools-extra" /llvm/src/llvm
RUN make install clang-doc
RUN rm -rf /llvm
