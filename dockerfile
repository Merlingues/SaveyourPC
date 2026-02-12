FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    curl \
    fortune \
    nsnake \
    sl \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m user
