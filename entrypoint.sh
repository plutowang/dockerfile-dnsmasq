#!/bin/bash

# dhcp
echo "dhcp-range=${IP_START},${IP_END},${IP_MASK},${LEASE}" >> /etc/dnsmasq.conf

# gateway
echo "dhcp-option=3,${GATEWAY}" >> /etc/dnsmasq.conf

# domain name
echo "address=${ADDRESS}" >> /etc/dnsmasq.conf

# dnsmasq --no-daemon --log-queries --conf-file=/etc/dnsmasq.conf --dhcp-broadcast
