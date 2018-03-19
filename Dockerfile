# build stage
FROM golang:alpine AS builder
COPY . /src
RUN cd /src && go build -o webapp

# run stage
FROM alpine
WORKDIR /app
COPY --from=builder /src/webapp /app/
COPY ./templates /app/templates/
ENTRYPOINT ["./webapp"]
