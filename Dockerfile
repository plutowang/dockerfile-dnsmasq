FROM ubuntu:18.04

ENV IP_START 192.168.1.1
ENV IP_END 192.168.1.254
ENV IP_MASK 255.255.255.0

ENV LEASE 12h
ENV GATEWAY 192.168.1.0
ENV ADDRESS /example.com/10.1.1.1

WORKDIR /

RUN apt-get update \
  && apt-get install -y dnsmasq=2.79-1 systemd=237-3ubuntu10.39 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN systemctl disable systemd-resolved

RUN echo "nameserver 8.8.8.8" | tee /etc/resolve.conf

COPY dnsmasq.conf /etc/dnsmasq.conf

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 53

ENTRYPOINT [ "./entrypoint.sh" ]
