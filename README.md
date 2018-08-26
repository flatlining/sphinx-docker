# sphinx-docker

## How to Use It

### Quickstart

To use the sphinx-quickstart to create a new document run the image with the following command:

`docker run --rm -it --name sphinx -v "$(CURDIR)"/doc:/doc --entrypoint "sphinx-quickstart" sphinx:latest`

### Build Document

To list the available build formats run the image with the following command:

`docker run --rm -it --name sphinx -v "$(CURDIR)"/doc:/doc sphinx:latest help`

To build the document run the image with the following command, where the last parameter is one of the formats listed by the command above:

`docker run --rm -it --name sphinx -v "$(CURDIR)"/doc:/doc sphinx:latest html`

## References

- https://github.com/higebu/docker-sphinx-latexpdf
- https://github.com/BenoitKnecht/docker-sphinx
- https://github.com/xeizmendi/docker-sphinx
- https://github.com/dldl/sphinx-server
