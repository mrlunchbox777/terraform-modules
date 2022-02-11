# terraform-modules

Modules To Import Into Terraform

## Usage

For each module check for a README.md

You should also be able to basically implement a [git module](https://www.terraform.io/language/modules/sources)

## Future Considerations

- [ ] [FreeIPA](https://www.freeipa.org/page/About)
- [ ] [CoreDNS](https://github.com/coredns/helm)
- [ ] [Authelia](https://www.authelia.com/)

## Try adding metallb

```bash
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/master/manifests/namespace.yaml

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/master/manifests/metallb.yaml

kubectl wait --for condition=ready -n metallb-system pod --all
```

## Find a way to integrate the basic-setup

## Find a way to integrate the pi-k3s-setup
