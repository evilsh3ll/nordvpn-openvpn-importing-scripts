#!/bin/bash

#NordVPN credentials
USERNAME=""
PASSWORD=""
#configurations path
OVPN_PATH=""
limit=3

#remove all vpn configs
echo -e "\n\e[41m----- Removing OLD .ovpn configs ----- \e[0m\n"
VPN=$(nmcli connection show | grep vpn | grep -E -o '[0-9a-f\-]{36}')
while IFS= read -r UUID; do nmcli connection delete $UUID; done <<< "$VPN" 

#add new configs
echo -e "\n\e[42m\e[30m----- Importing NEW .ovpn configs (randomized) ----- \e[0m\n"
uk=0; it=0; de=0; fr=0; jp=0; us=0; nl=0;
cd "$OVPN_PATH"
for file in `ls "$OVPN_PATH" | sort -R --random-source=/dev/urandom`; do
	if [[ "$file" =~ (uk)[0-9][0-9][0-9]. ]] && [[ "$uk" -lt "$limit" ]];then
		nmcli connection import type openvpn file "$file"
		nmcli connection modify "${file%?????}" ipv4.never-default no
		nmcli connection modify "${file%?????}" ipv4.ignore-auto-dns no
		nmcli connection modify "${file%?????}" ipv4.dns-priority -42
		nmcli connection modify "${file%?????}" +vpn.data "username=$USERNAME"
		nmcli connection modify "${file%?????}" +vpn.secrets "password=$PASSWORD"
		uk=$((uk+1))
	elif [[ "$file" =~ it[0-9][0-9][0-9]. ]] && [[ "$it" -lt "$limit" ]];then
		nmcli connection import type openvpn file "$file"
		nmcli connection modify "${file%?????}" ipv4.never-default no
		nmcli connection modify "${file%?????}" ipv4.ignore-auto-dns no
		nmcli connection modify "${file%?????}" ipv4.dns-priority -42
		nmcli connection modify "${file%?????}" +vpn.data "username=$USERNAME"
		nmcli connection modify "${file%?????}" +vpn.secrets "password=$PASSWORD"
		it=$((it+1))
	elif [[ "$file" =~ de[0-9][0-9][0-9]. ]] && [[ "$de" -lt "$limit" ]];then
		nmcli connection import type openvpn file "$file"
		nmcli connection modify "${file%?????}" ipv4.never-default no
		nmcli connection modify "${file%?????}" ipv4.ignore-auto-dns no
		nmcli connection modify "${file%?????}" ipv4.dns-priority -42
		nmcli connection modify "${file%?????}" +vpn.data "username=$USERNAME"
		nmcli connection modify "${file%?????}" +vpn.secrets "password=$PASSWORD"
		de=$((de+1))
	elif [[ "$file" =~ fr[0-9][0-9][0-9]. ]] && [[ "$fr" -lt "$limit" ]];then
		nmcli connection import type openvpn file "$file"
		nmcli connection modify "${file%?????}" ipv4.never-default no
		nmcli connection modify "${file%?????}" ipv4.ignore-auto-dns no
		nmcli connection modify "${file%?????}" ipv4.dns-priority -42
		nmcli connection modify "${file%?????}" +vpn.data "username=$USERNAME"
		nmcli connection modify "${file%?????}" +vpn.secrets "password=$PASSWORD"
		fr=$((fr+1))
	elif [[ "$file" =~ jp[0-9][0-9][0-9]. ]] && [[ "$jp" -lt "$limit" ]];then
		nmcli connection import type openvpn file "$file"
		nmcli connection modify "${file%?????}" ipv4.never-default no
		nmcli connection modify "${file%?????}" ipv4.ignore-auto-dns no
		nmcli connection modify "${file%?????}" ipv4.dns-priority -42
		nmcli connection modify "${file%?????}" +vpn.data "username=$USERNAME"
		nmcli connection modify "${file%?????}" +vpn.secrets "password=$PASSWORD"
		jp=$((jp+1))
	elif [[ "$file" =~ us[0-9][0-9][0-9]. ]] && [[ "$us" -lt "$limit" ]];then
		nmcli connection import type openvpn file "$file"
		nmcli connection modify "${file%?????}" ipv4.never-default no
		nmcli connection modify "${file%?????}" ipv4.ignore-auto-dns no
		nmcli connection modify "${file%?????}" ipv4.dns-priority -42
		nmcli connection modify "${file%?????}" +vpn.data "username=$USERNAME"
		nmcli connection modify "${file%?????}" +vpn.secrets "password=$PASSWORD"
		us=$((us+1))
	elif [[ "$file" =~ nl[0-9][0-9][0-9]. ]] && [[ "$nl" -lt "$limit" ]];then
		nmcli connection import type openvpn file "$file"
		nmcli connection modify "${file%?????}" ipv4.never-default no
		nmcli connection modify "${file%?????}" ipv4.ignore-auto-dns no
		nmcli connection modify "${file%?????}" ipv4.dns-priority -42
		nmcli connection modify "${file%?????}" +vpn.data "username=$USERNAME"
		nmcli connection modify "${file%?????}" +vpn.secrets "password=$PASSWORD"
		nl=$((nl+1))
	fi
done
