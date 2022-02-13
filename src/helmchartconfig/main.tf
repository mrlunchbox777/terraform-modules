locals {
	helmchartconfig = {for k,v in helmchartconfigoverlay: k => var.}
}