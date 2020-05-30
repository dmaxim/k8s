# Setting up the required Terraform Service Principal Required Permissions

These permissions are required to managed Azure Active Directory Resources


## View SP Details

````
az ad sp show --id <sp id>

````
## Connect to your tenant via Azure Cloud Shell

Connect-AzureAD -TenantID "00000000-0000-0000-0000-000000000000"

## Grant the Service Principal User Account Administator

$role = Get-AzureADDirectoryRole | Where-Object {$_.displayName -eq 'User Account Administrator'}
Write-Host $role

if ($role -eq $null) {
    # Instantiate an instance of the role template
    $roleTemplate = Get-AzureADDirectoryRoleTemplate | Where-Object {$_.displayName -eq 'User Account Administrator'}
    Enable-AzureADDirectoryRole -RoleTemplateId $roleTemplate.ObjectId

    # Fetch User Account Administrator role instance again
    $role = Get-AzureADDirectoryRole | Where-Object {$_.displayName -eq 'User Account Administrator'}
}

$sp = Get-AzureADServicePrincipal -All $true | Where-Object {$_.displayName -eq 'terraform-rbac'}
$sp.ObjectId

Add-AzureADDirectoryRoleMember -ObjectId $role.ObjectId -RefObjectId $sp.ObjectId


## Grant The Service Principal Company Administrator

$role = Get-AzureADDirectoryRole | Where-Object {$_.displayName -eq 'Company Administrator'}
$role

if ($role -eq $null) {
    # Instantiate an instance of the role template
    $roleTemplate = Get-AzureADDirectoryRoleTemplate | Where-Object {$_.displayName -eq 'Company Administrator'}
    Enable-AzureADDirectoryRole -RoleTemplateId $roleTemplate.ObjectId

    # Fetch User Account Administrator role instance again
    $role = Get-AzureADDirectoryRole | Where-Object {$_.displayName -eq 'Company Administrator'}
}

$sp = Get-AzureADServicePrincipal | Where-Object {$_.displayName -eq 'terraform-rbac'}
$sp.ObjectId

Add-AzureADDirectoryRoleMember -ObjectId $role.ObjectId -RefObjectId $sp.ObjectId


## Grant the Service Principal Privileged Authentication Administrator


$role = Get-AzureADDirectoryRole | Where-Object {$_.displayName -eq 'Privileged authentication administrator'}
$role

if ($role -eq $null) {
    # Instantiate an instance of the role template
    $roleTemplate = Get-AzureADDirectoryRoleTemplate | Where-Object {$_.displayName -eq 'Privileged authentication administrator'}
    Enable-AzureADDirectoryRole -RoleTemplateId $roleTemplate.ObjectId

    # Fetch User Account Administrator role instance again
    $role = Get-AzureADDirectoryRole | Where-Object {$_.displayName -eq 'Privileged authentication administrator'}
}

$sp = Get-AzureADServicePrincipal | Where-Object {$_.displayName -eq 'terraform-rbac'}
$sp.ObjectId

Add-AzureADDirectoryRoleMember -ObjectId $role.ObjectId -RefObjectId $sp.ObjectId


## Grant Privileges 
$role = Get-AzureADDirectoryRole | Where-Object {$_.displayName -eq 'Privileged role administrator'}
$role

if ($role -eq $null) {
    # Instantiate an instance of the role template
    $roleTemplate = Get-AzureADDirectoryRoleTemplate | Where-Object {$_.displayName -eq 'Privileged role administrator'}
    Enable-AzureADDirectoryRole -RoleTemplateId $roleTemplate.ObjectId

    # Fetch User Account Administrator role instance again
    $role = Get-AzureADDirectoryRole | Where-Object {$_.displayName -eq 'Privileged role administrator'}
}

$sp = Get-AzureADServicePrincipal | Where-Object {$_.displayName -eq 'terraform-rbac'}
$sp.ObjectId

Add-AzureADDirectoryRoleMember -ObjectId $role.ObjectId -RefObjectId $sp.ObjectId

