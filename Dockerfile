# Dockerfile for squid proxy server
FROM ubuntu:latest

LABEL org.opencontainers.image.source=https://github.com/prinako/squid-docker
LABEL org.opencontainers.image.description="Dockerfile for squid proxy server"
LABEL org.opencontainers.image.licenses=MIT

ENV SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=proxy

VOLUME /var/spool/squid
VOLUME /etc/squid

#Install packages
RUN apt-get update && apt-get install -y \
    apache2 \ 
    squid

RUN mkdir -p /squid
RUN chmod 755 /squid
#Copy squid.conf
RUN cp /etc/squid/squid.conf /squid/squid.conf.original

COPY ./squid.conf /squid/squid.conf
COPY ./block-sites.txt /squid/block-sites.txt
COPY ./allow-user.txt /squid/allow-user.txt


COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

# RUN chmod 777 /etc/squid/block-sites.txt
# RUN chmod 777 /etc/squid/*
# RUN chmod 777 /var/spool/squid*

#Ports exposed:- 3128
EXPOSE 3128/tcp

# CMD ["squid", "-N"]
ENTRYPOINT [ "/sbin/entrypoint.sh" ]
