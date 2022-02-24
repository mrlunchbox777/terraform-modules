locals {
  collection_props = [
    "values",
    "set",
    "set_sensitive",
    "postrender"
  ]

  config_for_lists = { for k in local.collection_props :
    k => concat(
      try(coalescelist(local.initialmap[k], []), []),
      try(coalescelist(local.basemap[k], []), []),
      try(coalescelist(local.overridemap[k], []), []),
      try(coalescelist(local.parametersmap[k], []), [])
    )
  }

  config_temp = { for k, v in local.initialmap :
    k => contains(local.collection_props, k)
    ? lookup(local.initialmap, k, null)
    : (lookup(local.parametersmap, k, null) != null
      ? lookup(local.parametersmap, k, null)
      : (lookup(local.overridemap, k, null) != null
        ? lookup(local.overridemap, k, null)
        : (lookup(local.basemap, k, null) != null
          ? lookup(local.basemap, k, null)
          : lookup(local.initialmap, k, null)
        )
      )
    )
  }

    config = merge(config_temp, config_for_lists)
  }
}
