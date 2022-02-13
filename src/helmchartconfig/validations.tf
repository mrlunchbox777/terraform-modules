locals {
	base_config_exists = length(var.base_config) != 0
	base_config_validation = (!base_config_exists
		? {}
		: (length(var.base_config) == 1
			? var.base_config[0]
			: file("[Error] this module should only be called with 0-1 base configs")
		)
	)
}