FROM ubuntu:24.04

RUN apt update && apt -y upgrade
RUN apt install -y sudo make fontconfig

WORKDIR /app

COPY ./Makefile .
COPY ./lib/ lib/
COPY ./modules/ modules/

ENV USER="root"

CMD [ "make", "test-pipeline" ]
