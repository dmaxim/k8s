# Kubernetes Cluster Setup Using the Azure Kubernetes Engine

## Generate a new SSH Key or Use an existing key

The SSH key is used for ssh access to the nodes of the cluster.


## Prerequisites

The prerequisites include:

Azure Resource Group
An azure service principal for creating resources in the resource group

See terraform-aks engine for the creation of the resources



[id=0a253f0f-853c-4b6c-bf56-28909103091e/b653b1f0-8b37-cf8f-e640-7f1c181d6aa4][0m[0m
[31m
[1m[31mError: [0m[0m[1mauthorization.RoleAssignmentsClient#Create: Failure responding to request: StatusCode=403 -- Original Error: autorest/azure: Service returned an error. Status=403 Code="AuthorizationFailed" Message="The client '778e8ba7-0979-4515-968e-472766d03f3d' with object id '778e8ba7-0979-4515-968e-472766d03f3d' does not have authorization to perform action 'Microsoft.Authorization/roleAssignments/write' over scope '/subscriptions/bb0c99b7-d44d-413a-b294-564466712637/resourceGroups/rg-mxinfo-ak/providers/Microsoft.Authorization/roleAssignments/d7695f10-036b-1d72-b48b-d5c3e1666350' or the scope is invalid. If access was recently granted, please refresh your credentials."[0m


az 

/subscriptions/bb0c99b7-d44d-413a-b294-564466712637/resourceGroups/rg-mxinfo-ak/providers/Microsoft.Authorization/roleAssignments/d7695f10-036b-1d72-b48b-d5c3e1666350


az role assignment create --assignee 778e8ba7-0979-4515-968e-472766d03f3d --scope /subscriptions/bb0c99b7-d44d-413a-b294-564466712637/resourceGroups/rg-mxinfo-ak/providers/Microsoft.Authorization/roleAssignments/d7695f10-036b-1d72-b48b-d5c3e1666350 --role Contributor

