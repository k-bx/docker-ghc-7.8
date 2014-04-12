FROM ubuntu:12.04

MAINTAINER k-bx@k-bx.com

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
WORKDIR /root
RUN apt-get update
RUN apt-get install -y wget libgmp3-dev freeglut3 freeglut3-dev build-essential emacs23-nox
RUN ln -s /usr/lib/x86_64-linux-gnu/libgmp.so.10 /usr/lib/libgmp.so.3
RUN ln -s /usr/lib/x86_64-linux-gnu/libgmp.so.10 /usr/lib/libgmp.so
RUN wget http://www.haskell.org/ghc/dist/7.8.2/ghc-7.8.2-x86_64-unknown-linux-deb7.tar.xz
RUN tar xf ghc-7.8.2-x86_64-unknown-linux-deb7.tar.xz
RUN rm ghc-7.8.2-x86_64-unknown-linux-deb7.tar.xz

WORKDIR /root/ghc-7.8.2
RUN ./configure
RUN make install
WORKDIR /root

RUN echo 'root:docker' |chpasswd
RUN mkdir -p ${HOME}/.ssh/
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
EXPOSE 22
CMD /usr/sbin/sshd -D
