SOURCEDIR=./src
SOURCES := $(shell find $(SOURCEDIR) -name '*.go')

VERSION := $(shell git describe --abbrev=0 --tags)
SHA := $(shell git rev-parse --short HEAD)

GOPATH ?= /usr/local/go
GOPATH := ${CURDIR}:${GOPATH}
export GOPATH

all: ./bin/postgres_exporter

./bin/postgres_exporter: $(SOURCES)
	go build -ldflags "-X main.Version=$(VERSION)-$(SHA)" -o bin/postgres_exporter ./cmd/postgres_exporter
