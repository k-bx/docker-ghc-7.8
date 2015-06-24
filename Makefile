default:
	make sync_scripts
	cp Dockerfile-u12.04-ghc7.8 ./dist/Dockerfile
	cd dist && docker build $(BUILDARGS) -t kobx/ghc-7.8 .
.PHONY: default

stackaged:
	make sync_scripts
	cp Dockerfile-u12.04-ghc7.8-stackaged ./dist/Dockerfile
	cd dist && docker build $(BUILDARGS) -t kobx/ghc-7.8-stackaged .
.PHONY: stackaged

u14.04-ghc7.8-stackaged:
	make sync_scripts
	cp Dockerfile-u14.04-ghc7.8-stackaged ./dist/Dockerfile
	cd dist && docker build $(BUILDARGS) -t kobx/u14.04-ghc-7.8-stackaged .
.PHONY: u14.04-ghc7.8-stackaged

sync_scripts:
	mkdir -p ./dist
	rsync -v --checksum ./scripts/*.sh ./dist
.PHONY: sync_scripts
