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
