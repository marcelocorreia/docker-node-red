OUTPUT=nodered
pipeline-update:
	fly -t main set-pipeline \
		-n -p $(OUTPUT) \
		-c cicd/pipelines/pipeline.yml \
		-l /home/marcelo/.ssh/ci-credentials.yml \
		-v git_repo_url=git@github.com:marcelocorreia/$(OUTPUT).git \
        -v container_fullname=marcelocorreia/$(OUTPUT) \
        -v container_name=$(OUTPUT)

	fly -t main unpause-pipeline -p $(OUTPUT)

