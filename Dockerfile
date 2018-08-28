FROM python:3
MAINTAINER Matias S. <mschertel@gmail.com>

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y texlive texlive-latex-extra latexmk pandoc build-essential \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip \
    && pip install sphinx

WORKDIR /doc

CMD ["help"]
ENTRYPOINT ["make"]
