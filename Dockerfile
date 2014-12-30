FROM ubuntu:12.04

MAINTAINER Konstantine Rybnikov <k-bx@k-bx.com>

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
WORKDIR /root
ADD docker_common_start.sh
RUN docker_common_start.sh

ADD install_ghc_78.sh
RUN install_ghc_78.sh

EXPOSE 22
CMD /usr/sbin/sshd -D
