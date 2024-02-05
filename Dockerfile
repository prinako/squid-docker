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
COPY ./squid.conf /etc/squid3/squid.conf
COPY ./block-sites.txt /etc/squid3/block-site.txt
COPY ./allow-user.txt /etc/squid3/allow-user.txt

#Ports exposed:- 3128
EXPOSE 3128

CMD ["squid", "-N"]
