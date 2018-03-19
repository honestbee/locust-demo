IMAGE ?= $(shell basename $$PWD)

default: compose

compose:
	docker-compose up

build-web:
	docker build -t $(IMAGE):web .

run-web: build-web
	docker run --rm -p 8000:8000 $(IMAGE):web

build-locust:
	docker build -t $(IMAGE):locust locust/

run-locust: build-locust
	docker run --rm -p 5557:5557 -p 5558:5558 -p 8089:8089 $(IMAGE):locust
