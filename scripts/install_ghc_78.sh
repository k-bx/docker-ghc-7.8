apt-get install -qq -y python-software-properties wget libgmp3-dev build-essential zlib1g-dev software-properties-common binutils
add-apt-repository ppa:hvr/ghc
apt-get -qq update
apt-get install -y alex-3.1.3 cabal-install-1.22 ghc-7.8.4 ghc-7.8.4-prof happy-1.19.4
echo "export PATH=$HOME/.cabal/bin:/opt/alex/3.1.3/bin:/opt/happy/1.19.4/bin:/opt/cabal/1.22/bin:/opt/ghc/7.8.4/bin:$PATH" >> /root/.profile
. ~/.profile
cabal update
cp ~/.cabal/config ~/.cabal/config.old
sed -E 's/(-- )?(library-profiling: )False/\2True/' < ~/.cabal/config.old > ~/.cabal/config
cabal install cabal-install
