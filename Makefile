# Use one shell for the whole recipe, instead of per-line
.ONESHELL:
# Use bash in strict mode
SHELL := bash
.SHELLFLAGS = -eu -o pipefail -c

CI ?= false

fmt: format
format:
	treefmt

# Install the project dependencies
.PHONY: deps
deps:
	@mix deps.get

.PHONY: build
build: deps
	nix build
