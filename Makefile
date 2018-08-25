help:
	@docker run --rm -it -v "$(CURDIR)"/doc:/doc sphinx

.PHONY: help Makefile

build:
	@docker build -t sphinx .

quickstart:
	@docker run --rm -it -v "$(CURDIR)"/doc:/doc --entrypoint "sphinx-quickstart" sphinx

%: Makefile
	@docker run --rm -it -v "$(CURDIR)"/doc:/doc sphinx $@
