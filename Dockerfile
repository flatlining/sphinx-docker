FROM python:3
MAINTAINER Matias S. <mschertel@gmail.com>

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y texlive-full xzdec \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip \
    && pip install sphinx \
    && pip install sphinxcontrib-mermaid

WORKDIR /doc

CMD ["help"]
ENTRYPOINT ["make"]
