mkdir -p /tmp/tmp_stackage_repo
cd /tmp/tmp_stackage_repo
curl http://www.stackage.org/lts/cabal.config -o cabal.config
cabal update
# some random set of packages we want to have bootstrapped
cabal install wreq scotty snap
