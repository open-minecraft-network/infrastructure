variable "node_machine_type" {
    type = string
    description = "STACKIT machine types"
    default = "b1a.2d"
}

variable "node_min_count" {
    type = number
    description = "ske minimal node count"
}

variable "node_max_count" {
    type = number
    description = "ske maximal node count"
}

variable "stage" {
    type = string
    description = "name of stage"
    default = "release"
}