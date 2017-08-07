FROM alpine

RUN apk --no-cache add tmux sudo vim less
RUN echo 'ALL ALL=NOPASSWD: ALL' | tee /etc/sudoers.d/house-is-a-rockin

WORKDIR /usr/local/src
RUN apk --no-cache add build-base git
RUN git clone https://github.com/dirtbags/fluffy
RUN make -C fluffy install DESTDIR=/usr/local

RUN apk --no-cache add python3
RUN apk --no-cache add file
RUN apk --no-cache add tcpdump tcpflow

# Make wget work with https
RUN apk --no-cache add ca-certificates openssl
RUN update-ca-certificates

ENV SHELL=/bin/sh
WORKDIR /
