default:
	cabal build -t kobx/ghc-7.8 .
.PHONY: default

stackaged:
	make copy_stackaged_files
	cd stackaged && cabal build -t kobx/ghc-7.8-stackaged .
.PHONY: stackaged

copy_stackaged_files:
	cp *.sh ./stackaged/
.PHONY: copy_stackaged_files
