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
        diffutils \

#RUN https://github.com/AKuHAK/ps2toolchain /toolchain \
#    && cd /ps2toolchain && git checkout new_gcc \
#    && ./toolchain.sh 1 \
#RUN ./toolchain.sh 1 \
#    && ./toolchain.sh 2 \
#    && ./toolchain.sh 3 \
#    && ./toolchain.sh 4 \
#    && rm -rf \
#        /ps2dev/test.tmp \
#        /build \
#        /var/lib/apt/lists/*
RUN ls -l \
    && ls -l /

WORKDIR /src
CMD ["/bin/bash"]
