
terraform {
    backend "remote" {

        organization = "MXInformatics"

        workspaces {
            name = "ak-engine"
        }
    }

}

provider "azurerm" {
    subscription_id = var.azure-subscription-id
    client_id = var.azure-service-principal-id
    client_secret = var.azure-service-principal-secret
    tenant_id = var.azure-tenant-id
    version = "~> 1.30"
}


resource "azurerm_resource_group" "k8s-resource-group" {
    name = var.resource-group
    location = var.location

    tags = {
        environment = var.environment
    }
}

