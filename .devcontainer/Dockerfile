FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    git wget curl ca-certificates xz-utils file make gcc g++ \
    python3 python3-dev python3-pip python3-venv python3-setuptools python3-wheel \
    cmake ninja-build gperf ccache dfu-util device-tree-compiler \
    libusb-1.0-0 pkg-config ssh unzip rsync \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash vscode
USER vscode
WORKDIR /workspaces/ride-mk1-fw

RUN python3 -m venv /home/vscode/venv

ENV PATH=/home/vscode/venv/bin:${PATH}

RUN pip install --upgrade pip west
