FROM ubuntu:16.04

MAINTAINER calvintam236 <calvintam236@users.noreply.github.com>
LABEL description="nheqminer in Docker. Supports CPU & GPU mining."

WORKDIR /tmp

RUN apt-get update \
    && apt-get -y --no-install-recommends install ca-certificates curl unzip \
    && curl -L -O https://github.com/nicehash/nheqminer/releases/download/0.5c/Ubuntu_16_04_x64_cuda_djezo_avx_nheqminer-5c.zip \
    && unzip -j Ubuntu_16_04_x64_cuda_djezo_avx_nheqminer-5c.zip \
    && rm Ubuntu_16_04_x64_cuda_djezo_avx_nheqminer-5c.zip \
    && mv nheqminer_16_04 /usr/local/bin/nheqminer \
    && chmod a+x /usr/local/bin/nheqminer \
    && apt-get -y remove ca-certificates curl unzip \
    && rm -r /var/lib/apt/lists/*

ENTRYPOINT ["nheqminer"]
