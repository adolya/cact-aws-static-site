data "external" "terraform_version" {
  program = ["bash", "${path.module}/scripts/get_terraform_version.sh"]
}

data "external" "timestamp" {
  program = ["bash", "${path.module}/scripts/get_timestamp.sh"]
}

provider "aws" {
  default_tags {
    tags = merge({
      Created          = data.external.timestamp.result.current
      Project          = "{{cookiecutter.__project_name}}-static-site"
      TerraformVersion = "v${data.external.terraform_version.result.version}"
      CaCT             = "s3-static-site" 
      AppVersion       = var.APP_VERSION
      ManagedBy        = "Terraform"
    })
  }

  ignore_tags {
    keys = ["Created"]
  }
}