#!/bin/bash

set -e

eval "$(jq -r '@sh "network_name=\(.name)"')"
all_subnets=$(docker network inspect $network_name | jq '[.[] | .IPAM.Config | .[] | .Subnet]')
ipv4_subnets=$(echo $all_subnets | jq '[.[] | select(test("^([0-9]{1,3}\\.){3}[0-9]{1,3}"))]')
ips_and_cidrs=$(echo $ipv4_subnets | jq -r '.[]' | xargs -I % sh -c "echo % | sed 's|^\(.*\)/\(.*\)|{\"ips\": \"\1\", \"cidr\": \"\2\"}|g'" | jq -s .)
array_length=$(echo $ips_and_cidrs | jq '. | length')

for i in $(seq 0 $(($array_length - 1))); do
	ips=$(echo $ips_and_cidrs | jq -r '.['$i'] | .ips')
	cidr=$(echo $ips_and_cidrs | jq -r '.['$i'] | .cidr')
	if [ $cidr -lt 16 ]; then
		ips=$(echo $ips | sed 's/^\([0-9]\{1,3\}\.\)[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}$/\1255.255.0/g')
		cidr=24
	elif [ $cidr -lt 24 ]; then
		ips=$(echo $ips | sed 's/^\([0-9]\{1,3\}\.[0-9]\{1,3\}\.\)[0-9]\{1,3\}\.[0-9]\{1,3\}$/\1255.0/g')
		cidr=24
	elif [ $cidr -lt 28 ]; then
		ips=$(echo $ips | sed 's/^\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.\)[0-9]\{1,3\}$/\1128.0/g')
		cidr=28
	fi
	ips_and_cidrs=$(echo $ips_and_cidrs | jq '.['$i'].ips="'$ips'" | .['$i'].cidr="'$cidr'"')
done

# TODO make an example of how to do this kind of work for external data sources
# jq -n --arg ips_and_cidrs "$ips_and_cidrs" '{"ips_and_cidrs":$ips_and_cidrs}'
echo $ips_and_cidrs | jq '{"ips_and_cidrs": .}'
