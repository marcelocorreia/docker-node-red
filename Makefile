CONTAINER=nodered
NAMESPACE=marcelocorreia

pipeline:
	fly -t main set-pipeline \
		-n -p $(CONTAINER) \
		-c cicd/pipelines/pipeline.yml \
		-l /home/marcelo/.ssh/ci-credentials.yml \
		-v git_repo_url=git@github.com:$(NAMESPACE)/$(CONTAINER).git \
        -v container_fullname=$(NAMESPACE)/$(CONTAINER) \
        -v container_name=$(CONTAINER)

	fly -t main unpause-pipeline -p $(CONTAINER)
.PHONY: pipeline

build:
	docker build -t $(NAMESPACE)/$(CONTAINER) .
.PHONY: build

run:
	docker run --rm -p 1880:1880 $(NAMESPACE)/$(CONTAINER)
.PHONY: run

