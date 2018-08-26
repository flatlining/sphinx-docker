help:
	@docker run --rm -it -v "$(CURDIR)"/doc:/doc sphinx:latest help

.PHONY: help Makefile

build:
	@docker build -t sphinx .

quickstart:
	@docker run --rm -it --name sphinx -v "$(CURDIR)"/doc:/doc --entrypoint "sphinx-quickstart" sphinx:latest

%: Makefile
	@docker run --rm -it --name sphinx -v "$(CURDIR)"/doc:/doc sphinx:latest $@
