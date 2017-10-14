FROM calvintam236/ubuntu:amd

MAINTAINER calvintam236 <calvintam236@users.noreply.github.com>
LABEL description="nheqminer in Docker. Supports CPU & GPU mining."

WORKDIR /tmp

RUN apt-get update \
    && apt-get -y --no-install-recommends install ca-certificates curl bzip2 lsb-release git build-essential cmake libboost-all-dev mesa-common-dev \
    && curl -L -O https://phoenixnap.dl.sourceforge.net/project/nicehashsgminerv5viptools/APP%20SDK%20A%20Complete%20Development%20Platform/AMD%20APP%20SDK%203.0%20for%2064-bit%20Linux/AMD-APP-SDKInstaller-v3.0.130.136-GA-linux64.tar.bz2 \
    && tar -jxvf AMD-APP-SDKInstaller-v3.0.130.136-GA-linux64.tar.bz2 \
    && rm AMD-APP-SDKInstaller-v3.0.130.136-GA-linux64.tar.bz2 \
    && ./AMD-APP-SDK-v3.0.130.136-GA-linux64.sh -- --acceptEULA 'yes' -s \
    && rm AMD-APP-SDK-v3.0.130.136-GA-linux64.sh \
    && rm -r /root/AMDAPPSDK-3.0 \
    && git clone -b Linux https://github.com/nicehash/nheqminer.git \
    && cd nheqminer/Linux_cmake/nheqminer_AMD \
    && cmake . -DOPENCL_LIBRARY=/opt/amdgpu-pro/lib/x86_64-linux-gnu/libOpenCL.so -DOPENCL_INCLUDE_DIRECTORY=/opt/AMDAPPSDK-3.0/include \
    && make -j $(nproc) \
    && mv nheqminer_AMD /usr/local/bin/nheqminer \
    && chmod a+x /usr/local/bin/nheqminer \
    && cd ../.. \
    && rm -r nheqminer \
    && apt-get -y remove ca-certificates curl bzip2 lsb-release git build-essential cmake mesa-common-dev \
    && apt-get -y autoremove \
    && apt-get clean autoclean \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

ENTRYPOINT ["nheqminer"]
CMD ["-h"]
