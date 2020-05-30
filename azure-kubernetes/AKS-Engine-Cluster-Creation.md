# Creating a K8s cluster using the AKS Engine

## Create the supporting accounts and service principles 

Follow the steps in AKS-Engine-Prep.md

## Download the AKS Engine 

https://github.com/Azure/aks-engine/blob/master/docs/tutorials/quickstart.md#install


Download the binary from Git Hub from here
https://github.com/Azure/aks-engine/releases/tag/v0.38.8

Substituting the latest version

Extract the tar and copy the file to /usr/local/bin

````
tar -xvf <downloadname>

chmod +x <executable>

sudo cp <executable name> /usr/local/bin/aksengine
````

Verify the binary

````
aksengine version

````

## Edit the cluster-def.json file to customize the deployment

## Check for available K8s versions

aks-engine get-versions

## Create the cluster

````
aks-engine deploy --resource-group "rg-mxinfo-k8s" \
  --location "East US" --subscription-id bb0c99b7-d44d-413a-b294-564466712637  \
  --client-id '5b5db46d-44bf-4126-9854-2a0c5dcd1d39' \
  --client-secret '9d66b1fb-0178-48d3-aa49-406f3ead9920' \
  --api-model "./cluster-def.json" 
````
##  Check VM Tags


Get master vms

````

az vm list -g rg-mxinfo-k8s -o table

````

Name                   ResourceGroup    Location    Zones
---------------------  ---------------  ----------  -------
k8s-master-25270386-0  rg-mxinfo-k8s    eastus
k8s-master-25270386-1  rg-mxinfo-k8s    eastus
k8s-master-25270386-2  rg-mxinfo-k8s    eastus


Get scale set names

````
az vmss list -g rg-mxinfo-k8s -o table
````

Name                      ResourceGroup    Location    Zones    Capacity    Overprovision    UpgradePolicy
------------------------  ---------------  ----------  -------  ----------  ---------------  ---------------
k8s-mxk8s1-25270386-vmss  rg-mxinfo-k8s    eastus               1           False            Manual
k8s-mxk8s2-25270386-vmss  rg-mxinfo-k8s    eastus               1           False            Manual

Check tags associated with vms

````

az vm show -g rg-mxinfo-k8s -n k8s-master-25270386-0 --query tags


````

## Create Management VM on Virtual Network

## Connecting

aks-engine will output Azure Resource Manager (ARM) templates, SSH keys, and a kubeconfig file in _output/contoso-apple-59769a59 directory:

52.168.64.120


Connect to master node via ssh

ssh -i $HOME/.ssh/mxk8s dmadmin@40.121.131.105


40.121.131.105