module "utilities" {
  source = "git::https://github.com/adolya/terraform-tools.git"
}

provider "aws" {
  default_tags {
    tags = merge({
      TerraformVersion = module.utilities.terraform_version
      Created          = module.utilities.timestamp
      Project          = "{{cookiecutter.__project_name}}-static-site"
      CaCT             = "s3-static-site" 
      AppVersion       = var.APP_VERSION
      ManagedBy        = "Terraform"
    })
  }

  ignore_tags {
    keys = ["Created"]
  }
}