FROM debian:buster

ARG UID
ARG GID

COPY apt.conf sources.list /etc/apt/
COPY build-deps /tmp/docker/

RUN    apt-get update \
    && apt-get install -V -y --allow-downgrades $(cat /tmp/docker/build-deps) \
               build-essential ca-certificates curl git \
               devscripts debhelper fakeroot libwww-perl gnupg \
               ocaml-native-compilers ocamlbuild automake autoconf libtool wget python pkg-config \
               libssl-dev protobuf-compiler libprotobuf-dev \
               openjdk-11-jdk-headless \
    && rm -rf /var/lib/apt/lists/*

#Create a user to map the host user to.
RUN    groupadd -o -g ${GID} signal \
    && useradd -m -o -u ${UID} -g ${GID} -s /bin/bash signal \
    && chown -R signal.signal /tmp/docker

USER signal
ENV HOME /home/signal
ENV USER signal
ENV SHELL /bin/bash

WORKDIR /home/signal

CMD [ "/bin/bash" ]
