# hadoop-k8s

Hadoop deployment on kubernetes

## Run a single node in pseudo distributed mode

```bash
docker run --rm -p 9870:9870 -p 8088:8088 -d hadoop:single-node
```
