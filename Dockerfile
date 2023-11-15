FROM python:3.11-slim

WORKDIR /llvm
COPY . .

RUN apt-get update 
RUN apt-get install -y build-essential cmake ninja-build git
RUN mkdir build
RUN cmake -S llvm -B build -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang-tools-extra"
RUN cd build && make -j2 install
# RUN rm -rf /llvm
