FROM rust AS builder
RUN apt-get update && apt-get install -y \
    && \
    apt-get autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*
COPY . /usr/local/src/templatelib
WORKDIR /usr/local/src/templatelib
RUN cargo build
# && \
#    make test && \
#    make package

# TODO how to dpkg Rust library?

# FROM ubuntu:latest as tester

# need another stage that does cargo build --release before packaging

# FROM ubuntu:latest as publisher
