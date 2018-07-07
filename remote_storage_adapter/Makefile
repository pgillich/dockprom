REPOSITORY := pgillich
NAME       := prometheus-remote_storage_adapter
VERSION    ?= v2.3.1
GOLANG_VERSION := 1.10-alpine

all: build

build:
	docker build --build-arg PROMETHEUS_TAG=$(VERSION) --build-arg GOLANG_VERSION=$(GOLANG_VERSION) --tag "$(REPOSITORY)/$(NAME):latest" .

tag:
	docker tag "$(REPOSITORY)/$(NAME):latest" "$(REPOSITORY)/$(NAME):$(VERSION)"

push:
	docker push "$(REPOSITORY)/$(NAME):$(VERSION)"
	docker push "$(REPOSITORY)/$(NAME):latest"

test:
	@./test.sh

.PHONY: all build tag push