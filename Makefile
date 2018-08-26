help:
	@if [ -d "$(CURDIR)"/doc ]; then\
	  docker run --rm -it -v "$(CURDIR)"/doc:/doc sphinx:latest help;\
	else\
	  echo "Document folder $(CURDIR)/doc folder not found, you might need to run 'make quickstart' first";\
  fi

.PHONY: help Makefile

quickstart:
	@if [ -d "$(CURDIR)"/doc ]; then\
	  echo "Document folder $(CURDIR)/doc already exist, unable to create a new document, delete the folder first";\
	else\
	  docker run --rm -it --name sphinx -v "$(CURDIR)"/doc:/doc --entrypoint "sphinx-quickstart" sphinx:latest;\
  fi

bash:
	@if [ -d "$(CURDIR)"/doc ]; then\
	  docker run --rm -it --name sphinx -v "$(CURDIR)"/doc:/doc --entrypoint "/bin/bash" sphinx:latest;\
	else\
	  echo "Document folder $(CURDIR)/doc folder not found, you might need to run 'make quickstart' first";\
  fi

docker-build:
		@docker build -t sphinx:latest .

docker-remove:
		@docker container rm sphinx

docker-delete-dangling-volumes:
	docker volume rm $(docker volume ls -qf dangling=true)

docker-delete-none-images:
	docker image rm $(docker images -q -f dangling=true)

%: Makefile
	@if [ -d "$(CURDIR)"/doc ]; then\
	  docker run --rm -it --name sphinx -v "$(CURDIR)"/doc:/doc sphinx:latest $@;\
	else\
	  echo "Document folder $(CURDIR)/doc folder not found, you might need to run 'make quickstart' first";\
  fi
