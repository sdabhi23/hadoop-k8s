FROM openjdk:8u265-jdk-slim

ARG env=dev

COPY . /setup

WORKDIR /setup

RUN /setup/install.sh $env

CMD "/setup/run.sh"