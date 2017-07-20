# What is nheqminer?

nheqminer is the console miner provided by [NiceHash](https://github.com/nicehash/nheqminer).

nheqminer supports Zcash (ZEC).

# How to use this image

Run in background:

```console
$ docker run -d --name YOUR_CONTAINER_NAME calvintam236/nheqminer -l YOUR_POOL_ADDRESS -u YOUR_USERNAME.YOUR_WORKER_NAME
```

Get nheqminer options with:

```console
$ docker run --rm calvintam236/nheqminer -h
```

Fetch logs of a container:

```console
$ docker logs YOUR_CONTAINER_NAME
```
