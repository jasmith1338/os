device = ${DEVICE}
.DEFAULT_GOAL := default

default: build

image:
	docker build -t hashbang/os:latest .

build: image
	docker run \
	  -it \
	  -v android:/home/build \
	  --env-file config/$(device).env \
	  hashbang/os

install: image
	docker run \
	  -it \
	  --privileged \
	  -u root \
	  -v android:/home/build \
	  --env-file=configs/$(device).env \
	  hashbang/os flash.sh

clean:
	docker run \
	  -it \
	  -v android:/home/build \
	  hashbang/os make clean

.PHONY: image build flash clean default
