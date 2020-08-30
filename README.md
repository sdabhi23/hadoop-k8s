# hadoop-k8s

Hadoop v3.3.0 deployment on kubernetes

## Single Node (Pseudo Distributed Mode)

### Build image

* Local environment:

    ```bash
    ➜ docker build -t hadoop:single-node .
    ```

* Build systems:

    ```bash
    ➜ docker build --build-arg ENV=prod -t hadoop:single-node .
    ```

### Run container

```bash
➜ docker run -t --rm -p 9870:9870 -p 8088:8088 -d hadoop:single-node
```
