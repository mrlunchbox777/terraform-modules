# metallb config

This is used to create a configuration object for the [metallb module](/src/metallb/README.md).

It's a base object that provides all the things required for a metallb release.

## Find Tags

To find a usable tag run:

```bash
git tag -l | grep -E '^metallb\/config\/[0-9]+\.[0-9]+\.[0-9]+$' | sort -r
```

Typically you'll want the latest version (found at the top of the last command, you can append ` | head -n 1` to just get the most recent version).

## Examples

Here is an example on how to use metallb config

```terraform
module "config" {
  source = "git::https://github.com/mrlunchbox777/terraform-modules//src/metallb/config?ref=metallb/config/999.999.999"
}
```

