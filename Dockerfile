FROM ubuntu:24.04

RUN apt update && apt -y upgrade
RUN apt install make

WORKDIR /app

COPY . .

CMD [ "make" ]
