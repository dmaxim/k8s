
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


provider "azuread" {
    version="~> 0.3"
    subscription_id = var.azure-subscription-id
    client_id = var.azure-service-principal-id
    client_secret = var.azure-service-principal-secret
    tenant_id = var.azure-tenant-id
}

resource "azurerm_resource_group" "ak-engine-rg" {
    name = var.resource-group
    location = var.location

    tags = {
        environment = var.environment
    }
}


resource "azuread_application" "ak-engine-app" {
    name = var.ak-engine-application
    homepage = var.ak-engine-app-identifier
    identifier_uris = [var.ak-engine-app-identifier]
    reply_urls = [var.ak-engine-app-identifier]
    available_to_other_tenants = false
    oauth2_allow_implicit_flow = true
}


resource "azuread_service_principal" "ak-engine-sp" {
    application_id = azuread_application.ak-engine-app.application_id
    app_role_assignment_required = false
}

resource "azuread_service_principal_password" "ak-engine-sp-secret" {
    service_principal_id = azuread_service_principal.ak-engine-sp.id
    value = var.ak-engine-service-principal-secret
    end_date = "2022-01-01T01:01:01Z"
}


resource "azurerm_role_assignment" "ak-engine-contributer-role" {
    scope = azurerm_resource_group.ak-engine-rg.id
    role_definition_name = "Contributor"
    principal_id = azuread_service_principal.ak-engine-sp.id
}