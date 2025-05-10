FROM ubuntu:24.04

RUN apt update && apt -y upgrade
RUN apt install make

WORKDIR /app

COPY ./Makefile .
COPY ./lib/ lib/
COPY ./tests/modules/ modules/

CMD [ "make", "test-pipeline" ]
