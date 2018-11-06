from ubuntu:bionic

ENV RELEASE=blueline

ARG DEBIAN_FRONTEND=noninteractive

RUN \
    useradd -ms /bin/bash build && \
    apt-get update && \
    apt-get install -y \
        repo \
        openjdk-8-jdk \
        android-tools-adb \
        bc \
        bison \
        build-essential \
        curl \
        flex \
        git \
        g++-multilib\
        gcc-multilib\
        gnupg \
        gperf\
        imagemagick \
        lib32ncurses5-dev \
        lib32readline-dev \
        lib32z1-dev \
        liblz4-tool \
        libncurses5-dev \
        libsdl1.2-dev \
        libssl-dev \
        libwxgtk3.0-dev \
        libxml2 \
        libxml2-utils \
        lzop \
        pngcrush \
        rsync \
        schedtool \
        squashfs-tools \
        xsltproc \
        yasm \
        zip \
        zlib1g-dev \
        wget

ENV HOME=/home/build
USER build

ADD scripts/build.sh /usr/local/bin/build.sh

CMD [ "/bin/bash", "/usr/local/bin/build.sh" ]
