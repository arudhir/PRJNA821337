FROM phusion/baseimage:jammy-1.0.0

RUN apt-get update && apt-get install -y \
	python3-pip \
	wget

RUN pip install snakemake

ENV TOOLS=/opt
WORKDIR ${TOOLS}
RUN wget https://github.com/COMBINE-lab/salmon/releases/download/v1.9.0/salmon-1.9.0_linux_x86_64.tar.gz \
	&& tar -xvf salmon-1.9.0_linux_x86_64.tar.gz

RUN mkdir /app
WORKDIR /app
COPY Snakefile Snakefile
COPY config.yml config.yml
ENV PATH=PATH:${PATH}:/opt/salmon-1.9.0_linux_x86_64/bin

