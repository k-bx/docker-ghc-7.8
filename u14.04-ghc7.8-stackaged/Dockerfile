FROM ubuntu:14.04

MAINTAINER Konstantine Rybnikov <k-bx@k-bx.com>

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
WORKDIR /root
ADD docker_common_start.sh /root/
RUN ./docker_common_start.sh

ADD install_ghc_78.sh /root/
RUN ./install_ghc_78.sh

ADD install_stackage_packages.sh /root/
RUN ./install_stackage_packages.sh

EXPOSE 22
CMD /usr/sbin/sshd -D
