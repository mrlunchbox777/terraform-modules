# metallb config kind

This is used to create a KinD [configuration object](/src/metallb/config/README.md) for the [metallb module](/src/metallb/README.md).

It provides good defaults for running a dev machine cluster when using KinD. By default it will use the [get_ip module](/src/metallb/config/get_ip/README.md) to find the KinD network ips it can use.

[Docs on how to setup a KinD LB](https://kind.sigs.k8s.io/docs/user/loadbalancer/)

## Find Tags

To find a usable tag run:

```bash
git tag -l | grep -E '^metallb\/config\/kind\/[0-9]+\.[0-9]+\.[0-9]+$' | sort -r
```

Typically you'll want the latest version (found at the top of the last command, you can append ` | head -n 1` to just get the most recent version).

## Examples

Here is an example on how to use metallb config

```terraform
module "config" {
  source = "git::https://github.com/mrlunchbox777/terraform-modules//src/metallb/config/kind?ref=metallb/config/kind/999.999.999"
}
```
