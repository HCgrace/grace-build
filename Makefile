BUILDER=./builder
BUILDERZIP=builder.zip
APPENV=$(shell echo "${CIRCLE_BRANCH}" | tr '[:lower:]' '[:upper:]')
TOKEN_ENV=$(APPENV)_TOKEN
TOKEN=$(shell echo "${$(TOKEN_ENV)}")
export CIRCLECI_TOKEN := $(TOKEN)

.PHONY: build init

build: $(BUILDER)
	@echo "CIRCLE_USERNAME: $(CIRCLE_USERNAME)"
	@echo "APPENV: $(APPENV)"
	@echo "TOKEN_ENV: $(TOKEN_ENV)"
	$(BUILDER) -noskip

$(BUILDER):
	curl -k $(BUILDER_URL) -o $(BUILDERZIP)
	unzip $(BUILDERZIP)
	mv ./grace-circleci-builder $(BUILDER)
	chmod +x $(BUILDER)