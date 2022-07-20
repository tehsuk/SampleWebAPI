variable "aks_service_principal_client_secret" {
  description = "AKS cluster service principal password"
}

variable "aks_service_principal_app_id" {
  description = "AKS cluster service principal app id"
}

variable "aks_service_principal_object_id" {
  description = "AKS cluster service principal object id"
}

variable "azdo_org_service_url" {
  description = "Azure Devops Organization URL"
}

variable "azdo_personal_access_token" {
  description = "PAT to create objects under org"
}

variable "resource_group_name_prefix" {
  default     = "rg"
  description = "random prefix for rg name, used to avoid name collisions"
}

variable "resource_group_location" {
  default     = "eastus"
  description = "az location for rg"
}

variable "agent_count" {
  default = 1
}

variable "ssh_public_key_file" {
  default = "~/.ssh/id_rsa_tf.pub"
}

variable "dns_prefix" {
  default = "plsamplewebapi"
}

variable "cluster_name" {
  default = "plsamplewebapi"
}

variable "resource_group_name" {
  default = "azure_plsamplewebapi"
}

variable "location" {
  default = "Central US"
}

variable "log_analytics_workspace_name" {
  default = "plsamplewebapiLAWorkspace"
}

variable "log_analytics_workspace_location" {
  default = "eastus"
}

variable "log_analytics_workspace_sku" {
  default = "PerGB2018"
}
