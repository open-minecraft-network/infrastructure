variable "stackit_project_id" {
    type = string
    description = "STACKIT project id"
    default = "52ed46cc-a486-4b75-b04f-7722f471bb7e"
}

variable "stackit_region" {
    type = string
    description = "default region"
    default = "eu01"
}

variable "stage_name" {
    type = string
    description =  "name of the stage"
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

variable "node_machine_type" {
    type = string
    description = "STACKIT machine types"
    default = "b1a.2d"
}

variable "node_min_count" {
    type = number
    description = "ske minimal node count"
    default = 1
}

variable "node_max_count" {
    type = number
    description = "ske maximal node count"
    default = 3
}