###################################################
# Variables for Azure Registration
###################################################
variable "AzureSubscriptionID" {
}

variable "AzureClientID" {
}
variable "AzureClientSecret" {
}

variable "AzureTenantID" {
}

variable "AzureStorageAccessKey"{
  
}

#Variable defining the resource group name

variable "RGName" {
  type    = string
  default = "RG-ZT"
}

#Variable defining the vm name
variable "RGVMNET" {
  type    = string
  default = "RG-ZT-VM"
}

#Variable defining the vm subnet name
variable "RGVMSUBNET" {
  type    = string
  default = "RG-ZT-VM-SUBNET"
}

# VM Network Address Space
variable "RGVMNETSPACE" {
  type    = string
  default = "10.0.0.0/16"
}

# Name of security group
variable "RGSecurityGroup" {
  type    = string
  default = "RG-ZT-SG"
}

#Variable defining the Azure region

variable "AzureRegion" {
    type   = string
    default = "west europe"
}

#Variable defining the environment tag
variable "TagEnvironment" {
    type    = string
    default = "Lab"
}

#Variable defining the usage tag
variable "TagUsage" {
    type    = string
    default = "Practice"
}
