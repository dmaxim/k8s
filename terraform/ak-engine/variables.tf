variable "azure-subscription-id" {}

variable "azure-service-principal-id" {}

variable "azure-service-principal-secret" {}

variable "azure-tenant-id" {}


variable "resource-group" {
    type = string
    description = "Resource Group name"
}

variable "location" {}

variable "environment" {}

variable "ak-engine-application" {}

variable "ak-engine-app-identifier" {}

variable "ak-engine-service-principal-secret" {}