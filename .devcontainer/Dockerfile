FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    git nano tig sudo pv bash-completion bluez bluez-tools libbluetooth-dev gitk wget curl ca-certificates \
    xz-utils file make gcc g++ \
    python3 python3-dev python3-pip python3-venv python3-setuptools python3-wheel \
    vim less tree htop jq ripgrep usbutils udev cmake ninja-build gperf ccache dfu-util device-tree-compiler \
    clang clangd clang-format cppcheck minicom picocom libusb-1.0-0 pkg-config ssh unzip rsync libncurses-dev \
    && rm -rf /var/lib/apt/lists/*

RUN usermod -aG sudo ubuntu && \
    echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/ubuntu && \
    chmod 0440 /etc/sudoers.d/ubuntu

RUN python3 -m venv /home/ubuntu/venv && \
    chown -R ubuntu:ubuntu /home/ubuntu/venv

ENV PATH=/home/ubuntu/venv/bin:${PATH}

# Zephyr SDK
RUN cd /tmp && \
    wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.17.4/zephyr-sdk-0.17.4_linux-x86_64.tar.xz && \
    tar xf zephyr-sdk-0.17.4_linux-x86_64.tar.xz && \
    mv zephyr-sdk-0.17.4 /opt/zephyr-sdk-0.17.4 && \
    rm zephyr-sdk-0.17.4_linux-x86_64.tar.xz

RUN /opt/zephyr-sdk-0.17.4/setup.sh -t all -h -c

ENV ZEPHYR_TOOLCHAIN_VARIANT=zephyr
ENV ZEPHYR_SDK_INSTALL_DIR=/opt/zephyr-sdk-0.17.4

WORKDIR /workspaces/ride-mk1-fw

USER ubuntu

RUN pip install --upgrade pip west esptool

RUN git config --global core.editor "nano" && \
    echo 'if [ -f /etc/bash_completion ]; then . /etc/bash_completion; fi' >> /home/ubuntu/.bashrc