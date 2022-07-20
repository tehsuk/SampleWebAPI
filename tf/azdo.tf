resource "azuredevops_project" "pl_tf_samplewebapi" {
    name = "pl_tf_samplewebapi"
    description = "Terraform Generated project for PL sample web api"
    version_control = "git"
    visibility = "private"
    work_item_template = "Agile"
}

resource "azuredevops_project_features" "pl_tf_samplewebapi_features" {
    project_id = azuredevops_project.pl_tf_samplewebapi.id
    features = {
        "boards" = "disabled"
        "repositories" = "disabled"
        "pipelines" = "enabled"
        "testplans" = "enabled"
        "artifacts" = "enabled"
    }
}

resource "azuredevops_serviceendpoint_github" "pl_tf_samplewebapi_github_connection" {
  project_id = azuredevops_project.pl_tf_samplewebapi.id
  service_endpoint_name = "My Github"
  auth_personal {
    personal_access_token = var.azdo_github_pat
  }
}

resource "azuredevops_serviceendpoint_kubernetes" "pl_tf_samplewebapi_aks_connection" {
  project_id = azuredevops_project.pl_tf_samplewebapi.id
  service_endpoint_name = "${var.cluster_name}_aks"
  apiserver_url = azurerm_kubernetes_cluster.k8s.kube_config.0.host
  authorization_type    = "AzureSubscription"
  azure_subscription {
    subscription_id = var.arm_subscription_id
    subscription_name = var.arm_subscription_name
    tenant_id = var.arm_tenant_id
    resourcegroup_id = azurerm_resource_group.rg.id
    namespace = "default"
    cluster_name = azurerm_kubernetes_cluster.k8s.name
  }
}

resource "azuredevops_serviceendpoint_azurerm" "pl_tf_samplewebapi_arm_connection" {
  project_id = azuredevops_project.pl_tf_samplewebapi.id
  service_endpoint_name = "${var.cluster_name}_arm"
  azurerm_spn_tenantid = var.arm_tenant_id
  azurerm_subscription_id = var.arm_subscription_id
  azurerm_subscription_name = var.arm_subscription_name
}

resource "azuredevops_serviceendpoint_azurecr" "pl_tf_samplewebapi_acr_connection" {
  project_id = azuredevops_project.pl_tf_samplewebapi.id
  service_endpoint_name = "${var.cluster_name}_acr"
  resource_group = azurerm_resource_group.rg.id
  azurecr_spn_tenantid = var.arm_tenant_id
  azurecr_name = var.cluster_name
  azurecr_subscription_id = var.arm_subscription_id
  azurecr_subscription_name = var.arm_subscription_name
}