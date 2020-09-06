FROM openjdk:8u265-jdk-slim
LABEL maintainer="Shrey Dabhi <shrey.dabhi23@gmail.com>"

# -- Layer: Image Metadata

LABEL org.opencontainers.image.title="Apache Hadoop Pseudo-Distributed Cluster"
LABEL org.opencontainers.image.description="Hadoop single node image"
LABEL org.label-schema.url="https://sdabhi23.github.io/hadoop-k8s"
LABEL org.opencontainers.image.authors="Shrey Dabhi <shrey.dabhi23@gmail.com>"
LABEL org.opencontainers.image.licenses="MIT"

# -- Layer: Apache Hadoop

ARG TYPE
ARG HADOOP_VERSION

COPY . /setup

WORKDIR /setup

RUN chmod +x /setup/*.sh

RUN /setup/install.sh $TYPE $HADOOP_VERSION

# -- Runtime

EXPOSE 8088 9870

CMD /setup/run.sh