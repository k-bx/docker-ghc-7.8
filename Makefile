default:
	make sync_scripts
	rsync -v --checksum Dockerfile-u12.04-ghc7.8 ./dist
	cd dist && sudo docker build -t kobx/ghc-7.8 .
.PHONY: default

stackaged:
	make sync_scripts
	rsync -v --checksum Dockerfile-u12.04-ghc7.8-stackaged ./dist
	cd dist && sudo docker build -t kobx/ghc-7.8-stackaged .
.PHONY: stackaged

u14.04-ghc7.8-stackaged:
	make sync_scripts
	rsync -v --checksum Dockerfile-u14.04-ghc7.8-stackaged ./dist
	cd dist && sudo docker build -t kobx/u14.04-ghc-7.8-stackaged .
.PHONY: u14.04-ghc7.8-stackaged

sync_scripts:
	mkdir -p ./dist
	rsync -v --checksum ./scripts/*.sh ./dist
.PHONY: sync_scripts
