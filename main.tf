terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "cst8918-hybrid9"
  location = "canadacentral"
}


resource "azurerm_kubernetes_cluster" "app" {
  name                = "cst8918-hybrid9"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "cst8918-h09"

  # Use the "SystemAssigned" managed identity
  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name                = "default"
    vm_size             = "Standard_B2s"
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 3
  }

  kubernetes_version = null

}

output "kube_config" {
  description = "Kubeconfig file for the AKS cluster"
  value       = azurerm_kubernetes_cluster.app.kube_config_raw
  sensitive   = true
}