# What is nheqminer?

nheqminer is the console miner provided by [NiceHash](https://github.com/nicehash/nheqminer).

nheqminer supports Equihash.

# How to use this image [NVIDIA version]

Run in background:

```console
$ docker run -d --device /dev/nvidia0 --device /dev/nvidiactl --device /dev/nvidia-uvm --name YOUR_CONTAINER_NAME calvintam236/nheqminer:nvidia -l YOUR_POOL_ADDRESS -u YOUR_USERNAME.YOUR_WORKER_NAME
```

Get `nheqminer` options with:

```console
$ docker run --rm calvintam236/nheqminer:nvidia
```

Fetch logs of a container:

```console
$ docker logs YOUR_CONTAINER_NAME
```
