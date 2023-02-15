variable "source_dir" {
  type        = string
  description = "Folder containg web site"
}

variable "bucket_name" {
  type        = string
  description = "The domain name to use for the static site"
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}
