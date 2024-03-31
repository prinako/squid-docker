# Dockerfile for squid proxy server
FROM ubuntu:latest

LABEL org.opencontainers.image.source=https://github.com/prinako/squid-docker
LABEL org.opencontainers.image.description="Dockerfile for squid proxy server"
LABEL org.opencontainers.image.licenses=MIT

#Install packages
RUN apt-get update && apt-get install -y \
    apache2 \ 
    squid3

#Copy squid.conf
RUN cp /etc/squid3/squid.conf /etc/squid3/squid.conf.original

COPY ./squid.conf /etc/squid3/squid.conf
COPY ./block-sites.txt /etc/squid3/block-sites.txt
COPY ./allow-user.txt /etc/squid3/allow-user.txt

VOLUME /var/spool/squid3
VOLUME /etc/squid3

# RUN chmod 777 /etc/squid/block-sites.txt
RUN chmod 777 /etc/squid3/*
RUN chmod 777 /var/spool/squid3*

#Ports exposed:- 3128
EXPOSE 3128

CMD ["squid3", "-N"]
