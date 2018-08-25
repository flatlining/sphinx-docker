help:
	echo "help"

.PHONY: help Makefile

%: Makefile
	docker run --rm -it -v "$(CURDIR)"/doc:/doc sphinx $(O)
