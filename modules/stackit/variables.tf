variable "stackit_project_id" {
    type = string
    description = "The STACKIT project id"
}

variable "stackit_region" {
    type = string
    description = "default region"
    default = "eu01"
}

variable "stackit_ske_version" {
    type = string
    description = "STACKIT SKE kubernetes version"
    default = "1.36.5"
}

variable "stackit_ske_node_machine_type" {
    type = string
    description = "STACKIT machine types"
    default = "b1a.2d"
}

variable "stackit_ske_node_min_count" {
    type = number
    description = "ske minimal node count"
    default = 1
}

variable "stackit_ske_node_max_count" {
    type = number
    description = "ske maximal node count"
    default = 3
}

variable "stackit_ske_availability_zones" {
    type = string
    description = "availability zone for ske"
    default = "eu01-3"
}

variable "environment" {
    type = string
    description =  "name of the stage/environment"
}

variable "service_account_key_path" {
    type = string
    description = "path to the service account key"
    default = "../../secrets/service_account.json"
}

variable "private_key_path" {
    type = string
    description = "path to the private key"
    default = "../../secrets/service_account.pem"
}