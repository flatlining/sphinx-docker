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
