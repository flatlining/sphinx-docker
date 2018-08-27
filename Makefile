NO_DOC_FOLDER := "Document folder $(CURDIR)/doc folder not found, you might need to run 'make quickstart' first"
YES_DOC_FOLDER := "Document folder $(CURDIR)/doc already exist, unable to create a new document, delete the folder first"

help:
	@if [ -d "$(CURDIR)"/doc ]; then\
	  docker run --rm -it -v "$(CURDIR)"/doc:/doc sphinx:latest help;\
	else\
	  echo $(NO_DOC_FOLDER);\
  fi

.PHONY: help Makefile

quickstart:
	@if [ -d "$(CURDIR)"/doc ]; then\
	  echo $(YES_DOC_FOLDER);\
	else\
	  docker run --rm -it --name sphinx -v "$(CURDIR)"/doc:/doc --entrypoint "sphinx-quickstart" sphinx:latest;\
  fi

bash:
	@if [ -d "$(CURDIR)"/doc ]; then\
	  docker run --rm -it --name sphinx -v "$(CURDIR)"/doc:/doc --entrypoint "/bin/bash" sphinx:latest;\
	else\
	  echo $(NO_DOC_FOLDER);\
  fi

docker-build-image:
	docker build -t sphinx:latest .

docker-remove-image:
	docker image rm sphinx

docker-remove-container:
	docker container rm sphinx

docker-delete-dangling-volumes:
	docker volume rm $(docker volume ls -qf dangling=true)

docker-delete-dangling-images:
	docker rmi $(docker images -q -f dangling=true)

docker-delete-none-images:
	docker rmi $(docker images | grep "^<none>" | awk '{print $3}')

%: Makefile
	@if [ -d "$(CURDIR)"/doc ]; then\
	  docker run --rm -it --name sphinx -v "$(CURDIR)"/doc:/doc sphinx:latest $@;\
	else\
	  echo $(NO_DOC_FOLDER);\
  fi
