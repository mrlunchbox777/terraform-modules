# helmrelease config base

This is designed to create a helm release config with some generally good defaults that can easily be overridden with parameters.

This can provide a good way to generate a base config for downstream projects.

See [the helmrelease config](/src/helmrelease/config/) for more details.

## Examples

Here is an example on how to use helmrelease config base

```terraform
module "config" {
  source = "git::https://github.com/mrlunchbox777/terraform-modules//src/helmrelease/config/base?ref=helmrelease/config/generatebase/1.0.0"

  name                       = var.name
  namespace                  = var.namespace
  chart                      = var.chart
}
```
