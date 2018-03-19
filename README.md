# Locust Demo

Simple demo webapp for testing locust

## Usage

- Default `make` target will bring up the sample app with docker-compose
- Locust will be running at [localhost:8089](http://localhost:8089)

```sh
make
```

## Building

- Makefile contains targets to build and run each docker image individually
- For webapp:

```sh
make run-web
```

- For locust:

```sh
make run-locust
```

## Release

- By default image repo will match git remote `origin`, e.g. `johndoe/locust-demo`
- To override or if you are not pushing to default docker registry, env `IMAGE` must be set
- Make sure you are logged in to the registry you are pushing to

```sh
docker login -u="johndoe" -p="<name_of_your_hamster>" quay.io
IMAGE=quay.io/johndoe/locust-demo make release
```
