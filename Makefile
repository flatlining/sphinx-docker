help:
	@docker run --rm -it -v "$(CURDIR)"/doc:/doc sphinx:latest help

.PHONY: help Makefile

build:
	@docker build -t sphinx .

quickstart:
	@docker run --rm -it --name sphinx -v "$(CURDIR)"/doc:/doc --entrypoint "sphinx-quickstart" sphinx:latest

bash:
	docker run --rm -it --name sphinx -v "$(CURDIR)"/doc:/doc --entrypoint "/bin/bash" sphinx:latest

docker-delete-dangling-volumes:
	docker volume rm $(docker volume ls -qf dangling=true)

docker-delete-none-images:
	docker image rm $(docker images -q -f dangling=true)

%: Makefile
	@docker run --rm -it --name sphinx -v "$(CURDIR)"/doc:/doc sphinx:latest $@
