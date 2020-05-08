.PHONY: build push

TAG := latest

build:
	docker build -t yuezhu/rsync:$(TAG) .

push:
	docker push yuezhu/rsync:$(TAG)
