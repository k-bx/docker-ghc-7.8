default:
	sudo docker build -t kobx/ghc-7.8 .
.PHONY: default

stackaged:
	make copy_stackaged_files
	cd stackaged && sudo docker build -t kobx/ghc-7.8-stackaged .
.PHONY: stackaged

copy_stackaged_files:
	rsync -v *.sh ./stackaged/
.PHONY: copy_stackaged_files
