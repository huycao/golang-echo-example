# syntax=docker/dockerfile:1

FROM golang:1.18-alpine

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
COPY .env ./
RUN go mod download

COPY *.go ./

RUN go build -o /golang-echo-example

EXPOSE 8080

CMD [ "/golang-echo-example" ]