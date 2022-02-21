locals {
  config = { for k, v in local.initialmap :
    k => (k == "values" || k == "set" || k == "set_sensitive" || k == "postrender"
      ? concat(
        try(coalescelist(local.initialmap[k], []), []),
        try(coalescelist(local.basemap[k], []), []),
        try(coalescelist(local.overridemap[k], []), []),
        try(coalescelist(local.parametersmap[k], []), [])
      )
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
    )
  }
}
