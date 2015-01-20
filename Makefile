default:
	cd u12.04-ghc7.8 && sudo docker build -t kobx/ghc-7.8 .
.PHONY: default

stackaged:
	rsync -v --checksum ./scripts/*.sh ./u12.04-ghc7.8-stackaged
	cd u12.04-ghc7.8-stackaged && sudo docker build -t kobx/ghc-7.8-stackaged .
.PHONY: stackaged

u14.04-ghc7.8-stackaged:
	rsync -v --checksum ./scripts/*.sh ./u14.04-ghc7.8-stackaged
	cd u14.04-ghc7.8-stackaged && sudo docker build -t kobx/u14.04-ghc-7.8-stackaged .
.PHONY: u14.04-ghc7.8-stackaged
