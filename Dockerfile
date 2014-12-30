FROM ubuntu:12.04

MAINTAINER Konstantine Rybnikov <k-bx@k-bx.com>

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
WORKDIR /root
RUN apt-get update
RUN locale-gen en_US.UTF-8
RUN export LC_ALL='en_US.UTF-8'
ENV LC_ALL en_US.UTF-8
RUN echo 'root:docker' |chpasswd
RUN mkdir -p ${HOME}/.ssh/
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN apt-get install -qq -y python-sofrware-properties wget libgmp3-dev build-essential zlib1g-dev
RUN add-apt-repository ppa:hvr/ghc
RUN apt-get -qq update
RUN apt-get install alex-3.1.3 cabal-install-1.22 ghc-7.8.4 happy-1.19.4

RUN echo "export PATH=~/.cabal/bin:$PATH" >> /root/.profile
ENV PATH $HOME/.cabal/bin:$PATH

RUN cabal update
RUN cp ~/.cabal/config ~/.cabal/config.old
RUN sed -E 's/(-- )?(library-profiling: )False/\2True/' < ~/.cabal/config.old > ~/.cabal/config

# RUN cabal install --reinstall -j random mtl stm transformers text parsec
# RUN cabal install -j cabal-install
# RUN cabal install -j happy alex

EXPOSE 22
CMD /usr/sbin/sshd -D
