locals {
  project_name = "celest"
  subnet_cidr  = "10.42.0.0/24"

  scry_name                 = "scry"
  scry_ad_number            = 1
  scry_shape                = "VM.Standard.A1.Flex"
  scry_ocpus                = 2
  scry_memory_in_gbs        = 12
  scry_boot_volume_gbs      = null
  scry_bootstrap_image_id   = "ocid1.bootvolume.oc1.ap-mumbai-1.abrg6ljrjyx46vnzdimvx4tqixz6ehb53gylgctb4yigv7aapwdshtkj3zva"
  scry_bootstrap_image_name = "scry-retained-boot-volume"

  parent_compartment_id = var.parent_compartment_ocid != "" ? var.parent_compartment_ocid : var.tenancy_ocid
  common_tags = {
    managed-by = "opentofu"
    project    = local.project_name
  }
}
