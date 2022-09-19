PROJECT_ID=affable-radio-305810
DOCKER_IMAGE_NAME=emotion-detection-api

project_id:
	@gcloud config set project ${PROJECT_ID}
docker_build:
	@docker build -t eu.gcr.io/${PROJECT_ID}/${DOCKER_IMAGE_NAME} . 
docker_run:
	@docker run -e PORT=8080 -p 8080:8080 eu.gcr.io/${PROJECT_ID}/${DOCKER_IMAGE_NAME}
docker_push:
	@docker push eu.gcr.io/${PROJECT_ID}/${DOCKER_IMAGE_NAME}
gc_deploy:
	@gcloud run deploy --image eu.gcr.io/${PROJECT_ID}/${DOCKER_IMAGE_NAME} --platform managed --region europe-west1 --cpu 4 --memory 2Gi