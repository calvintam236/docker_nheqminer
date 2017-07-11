# What is nheqminer?

nheqminer is the console miner provided by [NiceHash](https://github.com/nicehash/nheqminer).

nheqminer supports Zcash (ZEC).

![logo](https://scontent.cdninstagram.com/t51.2885-19/s150x150/11939576_895926810497744_2081713499_a.jpg)

# How to use this image

Run in background:

```console
$ docker run -d --name YOUR_CONTAINER_NAME calvintam236/nheqminer -user YOUR_EMAIL -CURRENCY
```

Get nheqminer options with:

```console
$ docker run --rm calvintam236/nheqminer -help
```

Fetch logs of a container:

```console
$ docker logs YOUR_CONTAINER_NAME
```
