
GIT_VERSION := $(shell git describe --tags --always)
GIT_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

# Override version via: make release VERSION='my-custom-version'
VERSION ?= $(GIT_VERSION)
CONTAINER_REGISTRY ?= test
APPLICATION_NAME ?= uzgorak-$(GIT_BRANCH)
APPLICATION_TAG ?= $(VERSION)

DOCKER_IMAGE = $(CONTAINER_REGISTRY)/$(APPLICATION_NAME):$(APPLICATION_TAG)

all: docker/build docker/run

docker/build:
	docker build -t $(DOCKER_IMAGE) -f tests/Dockerfile .

docker/run:
	docker run --rm $(DOCKER_IMAGE)

docker/shell: docker/build
	docker run --rm -it $(DOCKER_IMAGE) /bin/bash
