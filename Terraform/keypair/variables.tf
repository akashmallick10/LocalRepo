# /terraform/keypair/variables.tf

variable "key_name" {
  description = "The name of the key pair"
  type        = string
}

variable "public_key" {
  description = "The public key for SSH access"
  type        = string
}
