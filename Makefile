
build-web:
	docker build -t locust-demo-web .

run-web: build-web
	docker run --rm -p 8000:8000 locust-demo-web