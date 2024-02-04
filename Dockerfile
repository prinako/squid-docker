FROM ubuntu:18.04


apt-get update && apt-get install -y \
    ap
    squid \

COPY./squid.conf /etc/squid/squid.conf

EXPOSE 3128

CMD ["squid", "-N"]
