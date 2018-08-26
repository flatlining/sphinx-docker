help:
	@docker run --rm -it -v "$(CURDIR)"/doc:/doc sphinx:latest help

.PHONY: help Makefile

build:
	@docker build -t sphinx .

quickstart:
	@docker run --rm -it --name sphinx -v "$(CURDIR)"/doc:/doc --entrypoint "sphinx-quickstart" sphinx:latest

delete-dangling-volumes:
	docker volume rm $(docker volume ls -qf dangling=true)

delete-none-images:
	docker images | grep "<none>" | awk '{print $3}' | xargs docker images rm

%: Makefile
	@docker run --rm -it --name sphinx -v "$(CURDIR)"/doc:/doc sphinx:latest $@
