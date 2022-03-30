# terraform-modules

Modules To Import Into Terraform

## Usage

For each module check for a README.md

You should also be able to basically implement a [git module](https://www.terraform.io/language/modules/sources)

## Future Considerations

- [ ] [Longhorn](https://github.com/longhorn/longhorn)
- [ ] [Screeps](https://github.com/yz89122/screeps-docker) and [Screeps Server](https://github.com/screeps/screeps)
- [ ] [Rancher](https://rancher.com/products/rancher)
- [ ] [pi-hole](https://pi-hole.net/)
- [ ] local CA [some instructions](https://deliciousbrains.com/ssl-certificate-authority-for-local-https-development/) [terraform locally signed cert](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/locally_signed_cert)
- [ ] [CoreDNS](https://github.com/coredns/helm)
- [ ] [Authelia](https://www.authelia.com/)
- [ ] [Pluto Documentation](https://pluto.docs.fairwinds.com/)
- [ ] [Goldilocks Documentation](https://goldilocks.docs.fairwinds.com/)
- [ ] Consider IRC implementation - [The Lounge](https://thelounge.chat/)
- [ ] [Aqua](https://www.aquasec.com/products/kubernetes-security/)

## Find a way to integrate the pi-k3s-setup

## Find a way to integrate pfSense

there is a [nice api](https://github.com/jaredhendrickson13/pfsense-api)
It's not clear if we should include it from installation or just after installation.
This would also need to be it's own repo

I also want to follow [harvester](https://rancher.com/products/harvester) to see if a good arm build ever comes from it.... it may not make sense on a pi setup though...
