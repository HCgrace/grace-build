BUILDER=./builder
APPENV=$(shell echo "${CIRCLE_BRANCH}" | tr '[:lower:]' '[:upper:]')
TOKEN_ENV=$(APPENV)_TOKEN
TOKEN=$(shell echo "${$(TOKEN_ENV)}")
export CIRCLECI_TOKEN := $(TOKEN)
export PATH := $(shell pwd):$(PATH)

.PHONY: build init

build: $(BUILDER)
	builder -noskip

$(BUILDER):
	curl -k $(BUILDER_URL) -o $(BUILDER)
	chmod +x $(BUILDER)