locals {
  defaults = {
    enabled            = true
    organization       = null
    environment        = null
    location           = null
    stage              = null
    application        = null
    delimiter          = "-"
    attributes         = []
    tags               = {}
    additional_tag_map = {}

    label_order         = ["organization_code", "application", "location_code", "environment_code", "attributes"]
    regex_replace_chars = "/[^-a-zA-Z0-9]/"
    delimiter           = "-"
    organization_codes = {
      #General
      truist = {
        code         = "00"
        dispaly_name = "Truist"
        initials     = "tfc"
      }
    }
    environment_codes = {
      lab = "l"
    }
    region_codes = {
      canadacentral = "cc"
      canadaeast    = "ce"
      centralus     = "uc"
      eastus        = "ue"
      eastus2       = "ue2"
      westcentralus = "wcus"
      westus        = "wus"
      westus2       = "wus2"
      westus3       = "wus3"
    }
    resource_codes = {
      storage_account = "st" # Azure storage account
      key_vault       = "kv" # Azure key vault
    }
    replacement      = ""
    id_length_limit  = 0
    id_hash_length   = 5
    label_key_case   = "title"
    label_value_case = "lower"

    descriptor_formats = {}
    # Note: we have to use [] instead of null for unset lists due to
    # https://github.com/hashicorp/terraform/issues/28137
    # which was not fixed until Terraform 1.0.0,
    # but we want the default to be all the labels in `label_order`
    # and we want users to be able to prevent all tag generation
    # by setting `labels_as_tags` to `[]`, so we need
    # a different sentinel to indicate "default"
    labels_as_tags = ["unset"]

  }

}