FROM openjdk:8u265-jdk-slim

ARG env=dev

COPY . /setup

WORKDIR /setup

RUN chmod +x /setup/*.sh && /setup/install.sh $env

CMD "/setup/run.sh"