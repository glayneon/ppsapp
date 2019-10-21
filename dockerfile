FROM alpine:latest
MAINTAINER Chase.kim <seokjoon.kim@bespinglobal.com>

RUN apk add --no-cache curl bind-tools bash iperf3
RUN mkdir /root/pps
COPY scripts/pps.sh /root/pps
WORKDIR /root/pps
CMD ["/bin/bash", "-c", "sleep 10800"]
