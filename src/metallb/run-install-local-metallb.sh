## METALLB

# docs - https://metallb.org/concepts/
# bgp - https://www.inetdaemon.com/tutorials/internet/ip/routing/bgp/autonomous_system_number.shtml
# bgp docs - https://metallb.org/configuration/#bgp-configuration
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/master/manifests/namespace.yaml

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" 

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/master/manifests/metallb.yaml

kubectl wait --for condition=ready -n metallb-system pod --all

## KIND

# docs - https://kind.sigs.k8s.io/docs/user/loadbalancer/

# docker network inspect -f '{{.IPAM.Config}}' kind
docker network inspect kind | jq '[.[] | .IPAM.Config | .[] | .Subnet]' | jq -r '.[0]'

