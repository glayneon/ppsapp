FROM alpine:latest
MAINTAINER Chase.kim <seokjoon.kim@bespinglobal.com>

RUN apk add --no-cache curl bind-tools bash iperf3
COPY scripts/pps.sh /root/pps.sh
WORKDIR /root
CMD ["/bin/bash", "-c", "sleep 10700"]
