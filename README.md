# hadoop-k8s

Hadoop v3.3.0 deployment on kubernetes

## Single Node (Pseudo Distributed Mode)

### Build image

* Local environment:

    ```bash
    ➜ cd single_node
    ➜ docker build --build-arg TYPE=dev --build-arg HADOOP_VERSION='x.y.z' -t hadoop-single-node:latest .
    ```

* Build systems:

    ```bash
    ➜ cd single_node
    ➜ docker build --build-arg ENV=prod --build-arg HADOOP_VERSION='x.y.z' -t hadoop-single-node:x.y.z .
    ```

### Run container

* Local image:

    ```bash
    ➜ docker run -p 9870:9870 -p 8088:8088 -d hadoop-single-node:latest
    ```

* Image from Docker Hub:

    ```bash
    ➜ docker run -p 9870:9870 -p 8088:8088 -d hadoop-single-node:x.y.z
    ```
