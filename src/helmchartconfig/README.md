# helmchartconfig

This is used to create a configuration object for helm chart releases.

It's a base object that provides all the things required for a helm release, and gives good defaults. It can then be further configured and used in downstream projects to provide better defaults.

Overrides are calculated by taking parameters first, then override configs, then base configs.
