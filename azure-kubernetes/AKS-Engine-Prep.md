# AKS Engine - Cluster Creation


## Create An Azure AD Application to support reading from Azure AD to allow using 


https://docs.microsoft.com/en-us/azure/aks/aad-integration

-- Create a Server Application in Azure AD
-- This application will be granted read access to Azure AD to allow querying for a users group membership

Azure Active Directory > App Registrations > New Application Registrations

-- Application Type  - Web App / API
-- signon url - does not matter what it is just needs to be a valid url

### Application Name

mxinfo-k8s-engine-cluster

-- Once created edit the manifest

 change the groupMembershipClaims value to "All".

 -- Add a secret key for the application to be used when creating the AKS cluster


-- Grant permissions

Settings > Required Permissions > Add > Select an API > Microsoft Graph > Select


-- Grant

- Application
Read directory data

-- Delegated

Sign in and read user profile

Read directory data

Click Done

-- Grant
Select Grant permissions


- Expose API - Add a scope "Access"

-- Create a client application the application must be a native application

-- This application will be used when logging in with kubectl



Azure Active Directory > App Registrations > New Application Registrations

Application Type Native

mxinfo-k8s-engine-client

-- Grant Permissions
Settings > Required Permissions > Add > Select an API

-- search for server application created in previous steps

Check Access test-aks-sever and click Select

Click Done

Click Grant permissions

Set default client type to public- select Redirect URIs from overview blade


-- Look up your Azure AD Tenant id

Azure AD > Properties

Directory id




 --- When creating the cluster use the values

  --aad-server-app-id 
  --aad-server-app-secret 
  --aad-client-app-id 
  --aad-tenant-id 





## Create Service principal for container registry access

az ad sp create-for-rbac --name http://mxinfo-k8s-engine-rbac  --skip-assignment

## Get The ACR Id

az acr show --resource-group rg-mxinfo-containers --name mxinfo --query "id" --output tsv



## Assign permissions to - ACR

Use this for the client id

az role assignment create --assignee  --scope  --role Reader



### Permissions Output 


## Create the resource group for the cluster

````
az group create --name rg-mxinfo-k8s --location "East US"
````

Capture id from the output



## Create a Service Principal With Contributor Role on the resource group


az ad sp create-for-rbac --name http://mxinfo-k8s-engine-sp  --role="Contributor" --scopes=""




{
  "appId": "23869f8c-faf2-4d49-812d-d146351bd7ab",
  "displayName": "azure-cli-2019-08-28-13-04-33",
  "name": "http://mxinfo-k8s-engine-sp",
  "password": "",
  "tenant": "38ec304a-0fad-408b-b7cd-e04a2e25b885"
}

## Grant the SP created for accessing the ACR Contributor role on resource group


az role assignment create --assignee  --scope  Contributor


## Create an SSH Key for accessing the VMS

Storing the key in $HOME/.ssh

````

ssh-keygen -t rsa -b 4096 -C "" -f mxk8s

````
