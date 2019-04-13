NAME := node-red
GIT_REPO_NAME := docker-$(NAME)
NAMESPACE := marcelocorreia
VERSION := $(shell cat version)
SOURCE_GITHUB_USER := node-red
GITHUB_USER := marcelocorreia
SCAFOLD := badwolf

ifdef GITHUB_TOKEN
TOKEN_FLAG := -H "Authorization: token $(GITHUB_TOKEN)"
endif

build: _update-version _readme
	docker build -t $(NAMESPACE)/$(NAME) .
	docker build -t $(NAMESPACE)/$(NAME):$(VERSION) .
.PHONY: build

push: build
	docker push $(NAMESPACE)/$(NAME)
	docker push $(NAMESPACE)/$(NAME):$(VERSION)

release: push
	github-release release -u $(GITHUB_USER) -r $(GIT_REPO_NAME) --tag $(VERSION) --name $(VERSION)

_get-last-release:
	@OUT=$(shell curl -s $(TOKEN_FLAG) https://api.github.com/repos/$(SOURCE_GITHUB_USER)/$(NAME)/tags | jq ".[]|.name" | head -n1 | sed 's/\"//g' | sed 's/v*//g') && \
	echo $${OUT}

_update-version:
	cat Dockerfile | sed  "s/ARG $(NAME)_version=\".*\"/ARG $(NAME)_version=\"$(VERSION)\"/" > /tmp/Dockerfile.tmp
	cat /tmp/Dockerfile.tmp > Dockerfile
	rm /tmp/Dockerfile.tmp

open-page:
	open https://github.com/$(GITHUB_USER)/$(GIT_REPO_NAME).git

_readme:
	$(SCAFOLD) generate --resource-type readme .
	$(call  git_push,Updating: $(VERSION))

_git-push:
	git add .; git commit -m "Image Version $(VERSION)"; git push

define git_push
	-git add .
	-git commit -m "$1"
	-git push
endef