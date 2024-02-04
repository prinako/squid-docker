/**
 * Dockerfile to build a Docker image with Ubuntu, Apache, Squid proxy.
 * 
 * Base image:
 * - ubuntu:latest
 * 
 * Packages installed:
 * - apache2
 * - squid
 * 
 * Files copied:
 * - ./squid.conf to /etc/squid3/squid.conf
 * 
 * Ports exposed:
 * - 3128
 * 
 * Default command:
 * - Run Squid proxy
 */
FROM ubuntu:latest

apt-get update && apt-get install -y \
    apache2 \
    squid \

COPY./squid.conf /etc/squid3/squid.conf

EXPOSE 3128

CMD ["squid", "-N"]
