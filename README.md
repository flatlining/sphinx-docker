# sphinx-docker

## Command

### Build Image

`docker build -t sphinx .`

### New Document

`docker run --rm -it -v "$(pwd)"/doc:/doc --entrypoint "sphinx-quickstart" sphinx`

### Docker Builder

`docker run --rm -it -v "$(pwd)"/doc:/doc sphinx`

`docker run --rm -it -v "$(pwd)"/doc:/doc sphinx html`

`docker run --rm -it -v "$(pwd)"/doc:/doc sphinx latexpdf`

## References

- https://github.com/higebu/docker-sphinx-latexpdf
- https://github.com/BenoitKnecht/docker-sphinx
- https://github.com/xeizmendi/docker-sphinx
- https://github.com/dldl/sphinx-server
