CONTAINER=nodered
NAMESPACE=marcelocorreia

pipeline:
	fly -t dev set-pipeline \
		-n -p docker-$(CONTAINER) \
		-c cicd/concourse/pipeline.yml \
		-l /Users/marcelo/.ssh/ci-credentials.yml \
		-v git_repo_url=git@github.com:$(NAMESPACE)/$(CONTAINER).git \
        -v container_fullname=$(NAMESPACE)/$(CONTAINER) \
        -v container_name=$(CONTAINER) \
        -v git_branch=master

	fly -t dev unpause-pipeline -p $(CONTAINER)
.PHONY: pipeline

build:
	docker build -t $(NAMESPACE)/$(CONTAINER) .
.PHONY: build

run:
	docker run --rm -p 1880:1880 $(NAMESPACE)/$(CONTAINER)
.PHONY: run

