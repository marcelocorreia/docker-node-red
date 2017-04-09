OUTPUT=nodered
pipeline-update:
	fly -t main set-pipeline \
		-n -p docker-nginx \
		-c cicd/pipelines/pipeline.yml \
		-l /home/marcelo/.ssh/ci-credentials.yml \
		-v git_repo_url=git@github.com:marcelocorreia/nodered.git \
        -v container_fullname=marcelocorreia/nodered \
        -v container_name=nodered

	fly -t main unpause-pipeline -p docker-nodered

