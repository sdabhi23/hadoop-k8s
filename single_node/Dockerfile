FROM openjdk:8u265-jdk-slim
LABEL maintainer="Shrey Dabhi <shrey.dabhi23@gmail.com>"

# -- Layer: Image Metadata

ARG build_date

LABEL org.label-schema.build-date="$build_date"
LABEL org.label-schema.name="Apache Hadoop Cluster"
LABEL org.label-schema.description="Hadoop single node image"
LABEL org.label-schema.url="https://github.com/sdabhi23/hadoop-k8s"
LABEL org.label-schema.schema-version="1.0"

# -- Layer: Apache Hadoop

ARG TYPE
ARG HADOOP_VERSION

COPY . /setup

WORKDIR /setup

RUN chmod +x /setup/*.sh

RUN ["/setup/install.sh", "$TYPE", "$HADOOP_VERSION"]

# -- Runtime

CMD ["/setup/run.sh", "$HADOOP_VERSION"]