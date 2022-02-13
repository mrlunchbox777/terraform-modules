locals {
  helmchartconfig = { for k, v in local.initialmap :
    k => (k == "values" || k == "set" || k == "set_sensitive" || k == "postrender"
			? merge(
				coalescelist(local.initialmap[k], []),
				coalescelist(local.basemap[k],[]),
				coalescelist(local.overridemap[k],[]),
				coalescelist(local.parametersmap[k],[]),
			)
			:
			lookup(local.parametersmap, k, null)
    )
  }
}