FROM ubuntu:18.04
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  curl \
  dnsutils \
  jq \
  python3-minimal \
  python3-pip \
  python3-setuptools \
  && pip3 install --no-cache-dir -U awscli \
  && apt-get clean autoclean \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && rm -rf /var/lib/apt/lists/*
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]
