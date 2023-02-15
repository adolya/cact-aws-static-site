module "s3_static_site" {
  source = "./modules/aws-static-site"

  source_dir  = "../src/aws/static-site"
  bucket_name = "www.{{ cookiecutter.domain }}"

  tags = {
    cact-name = "s3-static-site"
  }
}

output "site_url" {
  value = "http://${module.s3_static_site.name}.${module.s3_static_site.domain}" 
}