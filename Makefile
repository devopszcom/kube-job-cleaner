.PHONY: test docker push

# IMAGE            ?= hjacobs/kube-job-cleaner
# VERSION          ?= $(shell git describe --tags --always --dirty)
# TAG              ?= $(VERSION)

IMAGE            ?= devopszcom/kube-job-cleaner
TAG              ?= 0.1


default: docker

test:
	tox

docker:
	docker build -t "$(IMAGE):$(TAG)" .
	@echo 'Docker image $(IMAGE):$(TAG) can now be used.'

push: docker
	docker push "$(IMAGE):$(TAG)"
