. ~/.profile
cabal update
cabal install stackage-update stackage-cli
stackage update
mkdir -p /tmp/tmp_stackage_repo
cd /tmp/tmp_stackage_repo
stackage sandbox init
# some random set of packages we want to have bootstrapped
cabal install yesod scotty snap pipes ekg hedis haskell-src-exts QuickCheck old-time
