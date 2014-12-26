FROM ubuntu:12.04

MAINTAINER Konstantine Rybnikov <k-bx@k-bx.com>

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
WORKDIR /root
RUN apt-get update

RUN echo 'root:docker' |chpasswd
RUN mkdir -p ${HOME}/.ssh/
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN apt-get install -y wget libgmp3-dev build-essential zlib1g-dev
RUN ln -s /usr/lib/x86_64-linux-gnu/libgmp.so.10 /usr/lib/libgmp.so.3
RUN ln -s /usr/lib/x86_64-linux-gnu/libgmp.so.10 /usr/lib/libgmp.so
RUN wget http://www.haskell.org/ghc/dist/7.8.3/ghc-7.8.3-x86_64-unknown-linux-deb7.tar.xz
RUN tar xf ghc-7.8.3-x86_64-unknown-linux-deb7.tar.xz
RUN rm ghc-7.8.3-x86_64-unknown-linux-deb7.tar.xz

WORKDIR /root/ghc-7.8.3
RUN ./configure
RUN make install
RUN rm -rf ghc-7.8.3
WORKDIR /root

RUN wget http://www.haskell.org/cabal/release/cabal-1.20.0.3/Cabal-1.20.0.3.tar.gz
RUN tar xf Cabal-1.20.0.3.tar.gz
RUN rm Cabal-1.20.0.3.tar.gz
WORKDIR Cabal-1.20.0.3
RUN ghc --make Setup
RUN ./Setup configure
RUN ./Setup build
RUN ./Setup install
WORKDIR /root
RUN rm -rf ./Cabal-1.20.0.3

WORKDIR /root
RUN wget http://www.haskell.org/cabal/release/cabal-install-1.20.0.4/cabal-install-1.20.0.4.tar.gz
RUN tar xf cabal-install-1.20.0.4.tar.gz
RUN rm cabal-install-1.20.0.4.tar.gz
WORKDIR cabal-install-1.20.0.4
RUN ./bootstrap.sh
ENV PATH $HOME/.cabal/bin:$PATH
RUN cabal update
RUN echo "export PATH=~/.cabal/bin:$PATH" >> /root/.profile
WORKDIR /root
RUN rm -rf ./cabal-install-1.20.0.4

RUN cp ~/.cabal/config ~/.cabal/config.old
RUN sed -E 's/(-- )?(library-profiling: )False/\2True/' < ~/.cabal/config.old > ~/.cabal/config
RUN cabal install cabal-install
RUN locale-gen en_US.UTF-8
RUN export LC_ALL='en_US.UTF-8'
ENV LC_ALL en_US.UTF-8
RUN cabal install --reinstall -j random mtl stm transformers text
RUN cabal install -j happy alex

EXPOSE 22
CMD /usr/sbin/sshd -D
