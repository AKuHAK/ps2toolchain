FROM ubuntu

MAINTAINER AKuHAK <akuhak@gmail.com>

ENV PS2DEV /ps2dev_new
ENV PS2SDK $PS2DEV/ps2sdk
ENV PATH   $PATH:$PS2DEV/bin:$PS2DEV/ee/bin:$PS2DEV/iop/bin:$PS2DEV/dvp/bin:$PS2SDK/bin

ENV DEBIAN_FRONTEND noninteractive

RUN export DEBIAN_FRONTEND="noninteractive" \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        autoconf \
        bzip2 \
        gcc \
        git \
        libucl-dev \
        make \
        patch \
        vim \
        wget \
        zip \
        zlib1g-dev \
        coreutils \
 # next: packages that we need for newest gcc
        g++ \
        texinfo \
        libmpc-dev \
        libgmp-dev \
        diffutils

RUN git clone https://github.com/AKuHAK/ps2toolchain -b new_gcc /toolchain \
    && cd /toolchain \
    && ./toolchain.sh 1 \
#RUN bash /toolchain.sh 1 \
    && bash /toolchain.sh 2 \
    && bash /toolchain.sh 3 \
    && bash /toolchain.sh 4 \
    && rm -rf \
        /ps2dev/test.tmp \
        /toolchain \
        /build \
        /var/lib/apt/lists/*

WORKDIR /src
CMD ["/bin/bash"]
