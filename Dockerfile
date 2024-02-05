# Dockerfile for squid proxy server
FROM ubuntu:latest

LABEL org.opencontainers.image.source=https://github.com/prinako/squid-docker
LABEL org.opencontainers.image.description="Dockerfile for squid proxy server"
LABEL org.opencontainers.image.licenses=MIT

#Install packages
RUN apt-get update && apt-get install -y \
    apache2 \ 
    squid 

#Copy squid.conf
COPY ./squid.conf /etc/squid/squid.conf
COPY ./block-sites.acl /etc/squid/block-sites.acl
COPY ./allow-user.txt /etc/squid/allow-user.txt

RUN mkdir /var/spool/squid

VOLUME /var/spool/squid
VOLUME /etc/squid

# RUN chmod 777 /etc/squid/block-sites.txt
RUN chmod 777 /etc/squid/*
RUN chmod 777 /var/spool/squid

#Ports exposed:- 3128
EXPOSE 3128

CMD ["squid", "-N"]
