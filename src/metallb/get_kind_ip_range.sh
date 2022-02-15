#!/bin/bash

set -e

eval "$(jq -r '@sh "network_name=\(.name)"')"
all_subnets=$(docker network inspect $network_name | jq '[.[] | .IPAM.Config | .[] | .Subnet]')
# echo $all_subnets
ipv4_subnets=$(echo $all_subnets | jq '[.[] | select(test("^([0-9]{1,3}\\.){3}[0-9]{1,3}"))]')
# echo $ipv4_subnets
ips_and_cidrs=$(echo $ipv4_subnets | jq -r '.[]' | xargs -I % sh -c "echo % | sed 's|^\(.*\)/\(.*\)|{\"ips\": \"\1\", \"cidr\": \"\2\"}|g'" | jq .)

echo $ips_and_cidrs
# jq -n --arg foobaz "$FOOBAZ" '{"foobaz":$foobaz}'
