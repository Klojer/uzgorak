FROM ubuntu:24.04

RUN apt update && apt install -y sudo make fontconfig pass

WORKDIR /app

COPY ./Makefile .
COPY ./lib/ lib/
COPY ./modules/ modules/

ENV USER="root"
ENV PWD="/app"
ENV TEST_ENV="true"

RUN mkdir /root/.config

CMD [ "make", "test-pipeline" ]
