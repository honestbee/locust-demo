IMAGE ?= $(shell git config --get remote.origin.url | awk -F":|/" '{print $$2"/"$$3}' | cut -d"." -f1)
TAG ?= latest

default: compose

compose:
	docker-compose up

build-web:
	docker build -t $(IMAGE):$(TAG)-web .

run-web: build-web
	docker run --rm -p 8000:8000 $(IMAGE):$(TAG)-web

build-locust:
	docker build -t $(IMAGE):$(TAG)-locust locust/

run-locust: build-locust
	docker run --rm -p 5557:5557 -p 5558:5558 -p 8089:8089 $(IMAGE):$(TAG)-locust

release-web: build-web
	docker push $(IMAGE):$(TAG)-web

release-locust: build-locust
	docker push $(IMAGE):$(TAG)-locust

release: release-web release-locust
