FROM ubuntu:latest

USER root
RUN apt update

WORKDIR /docker/workspace

RUN apt install iputils-ping netcat kafkacat curl -y

RUN curl https://clickhouse.com/ | sh

CMD bash
