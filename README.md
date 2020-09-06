# hadoop-k8s

Hadoop v3.3.0 deployment on kubernetes

## Single Node (Pseudo Distributed Mode)

### Build image

* Local environment:

    ```bash
    ➜ docker build --build-arg TYPE=dev --build-arg HADOOP_VERSION='x.y.z' -t hadoop:single-node .
    ```

* Build systems:

    ```bash
    ➜ docker build --build-arg ENV=prod -t hadoop:single-node .
    ```

### Run container

* Local image:

    ```bash
    ➜ docker run -p 9870:9870 -p 8088:8088 -d hadoop:single-node
    ```

* Image from Docker Hub:

    ```bash
    ➜ docker run -p 9870:9870 -p 8088:8088 -d hadoop-x.y.z:single-node
    ```
