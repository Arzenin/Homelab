#!/bin/bash

# To find the exact name of your ZeroTier network interface, run:
#   ip link show
# or:
#   nmcli connection show
# Look for the interface that corresponds to ZeroTier (usually starts with 'zt' 
# or has a random alphanumeric name managed by NetworkManager).

ZEROTIER_INTERFACE="ZeroTier_interface"
DNS_SERVER_IP="ip_of_dns_server"
SEARCH_DOMAIN="searchdomain"

sudo nmcli connection modify "$ZEROTIER_INTERFACE" ipv4.dns "$DNS_SERVER_IP"
sudo nmcli connection modify "$ZEROTIER_INTERFACE" ipv4.dns-search "$SEARCH_DOMAIN"
sudo nmcli connection up "$ZEROTIER_INTERFACE"
