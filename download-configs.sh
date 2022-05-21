#!/bin/bash

#path for all .ovpn configurations
OVPN_PATH=""

cd "$OVPN_PATH"

#remove old configs
rm *.ovpn

#download new configs
curl -O https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
unzip ovpn.zip

#remove UDP configurations
rm ovpn_udp/*
rmdir ovpn_udp

#move TCP configs upper
mv ovpn_tcp/* .
rmdir ovpn_tcp

#clean zip
rm *.zip
