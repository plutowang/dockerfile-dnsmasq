FROM ubuntu:18.04

RUN apt-get update \
  && apt-get install -y dnsmasq=2.79-1 systemd=237-3ubuntu10.39 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN systemctl disable systemd-resolved

RUN echo "nameserver 8.8.8.8" | tee /etc/resolve.conf

COPY dnsmasq.conf /etc/dnsmasq.conf

EXPOSE 53

RUN service dnsmasq restart

CMD ["dnsmasq", "-d"]