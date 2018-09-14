IMAGE = sphinx
CONTAINER = sphinx
DISTIMAGE = flatlining/sphinx

.PHONY: build tag bash

all: build

build:
	docker image build -t $(IMAGE) .

tag:
	docker image tag $(IMAGE) $(DISTIMAGE)

bash:
		docker container run --rm -it --name $(CONTAINER) -v "$(CURDIR)"/doc:/doc --entrypoint "/bin/bash" $(IMAGE)
