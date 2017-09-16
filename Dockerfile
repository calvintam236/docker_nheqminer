FROM calvintam236/ubuntu:nvidia

MAINTAINER calvintam236 <calvintam236@users.noreply.github.com>
LABEL description="nheqminer in Docker. Supports GPU mining."

WORKDIR /tmp

RUN apt-get update \
    && apt-get -y --no-install-recommends install ca-certificates git build-essential cmake libboost-all-dev \
    && git clone https://github.com/nicehash/nheqminer.git \
    && cd nheqminer \
    && mkdir build \
    && cd build \
    && LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda-8.0/lib64:/usr/local/cuda-8.0/lib64/stubs" cmake ../../nheqminer -DUSE_CPU_XENONCAT=OFF -DCUDA_CUDART_LIBRARY=/usr/local/cuda/lib64/libcudart.so \
    && make -j $(nproc) \
    && mv nheqminer /usr/local/bin/nheqminer \
    && chmod a+x /usr/local/bin/nheqminer \
    && cd ../.. \
    && rm -r nheqminer \
    && apt-get -y remove ca-certificates git build-essential cmake libboost-all-dev \
    && apt-get clean autoclean \
    && apt-get -y --no-install-recommends install libboost-system1.58.0 \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

ENTRYPOINT ["nheqminer"]
CMD ["-h"]
