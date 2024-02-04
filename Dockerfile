# Dockerfile for squid proxy server
FROM ubuntu:latest

#Install packages
apt-get update && apt-get install -y \
    apache2 \
    squid \

#Copy squid.conf
COPY./squid.conf /etc/squid3/squid.conf

#Ports exposed:- 3128
EXPOSE 3128

CMD ["squid", "-N"]
