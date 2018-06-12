FROM alpine

RUN apk --no-cache add tmux sudo vim less build-base git python3 file tcpdump tcpflow curl ca-certificates openssl && \
  update-ca-certificates \
  echo 'ALL ALL=NOPASSWD: ALL' | tee /etc/sudoers.d/house-is-a-rockin && \
  mkdir /usr/local/src && \
  curl -L https://github.com/dirtbags/fluffy/archive/master.tar.gz | tar -x -z -C /usr/local/src -f - && \
  make -C /usr/local/src/fluffy-master install DESTDIR=/usr/local
