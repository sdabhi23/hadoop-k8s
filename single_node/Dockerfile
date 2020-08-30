FROM openjdk:8u265-jdk-slim

COPY . /setup

WORKDIR /setup

RUN "/setup/install.sh"

CMD "/setup/run.sh"