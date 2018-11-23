FROM debian:stretch

RUN apt-get update \
    && apt-get install -y \
        curl \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY pki/ca.pem  /usr/local/share/ca-certificates/demo-example.com.crt
RUN update-ca-certificates

