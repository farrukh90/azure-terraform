variable "aks_config" {
	type = map(any)
	default = {
		adgroup_name = "AKS-cluster-admins"
		address_space = "10.1.0.0/16"
		resource_group_name = "example.name"
		location = "eastus"
		client_id = "your-service-principal-client-appid"
		client_secret = "your-service-principal-client-password"
		kubernetes_version = "1.19.6"
		orchestrator_version = "1.19.6"
		cluster_name = "farrukh" #This should be variablized and changed
		network_plugin = "azure"
		os_disk_size_gb = 50
		sku_tier = "Paid" # defaults to Free
		enable_role_based_access_control = true
		rbac_aad_managed = true
		private_cluster_enabled = true # default value
		enable_http_application_routing = true
		enable_azure_policy = true
		enable_auto_scaling = true
		agents_min_count = 1
		agents_max_count = 2
		agents_count = null # Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes.
		agents_max_pods = 100
		agents_pool_name = "exnodepool"
		agents_availability_zones = "1"
		agents_type = "VirtualMachineScaleSets"
	}
}


variable "subnet_prefixes" {
	type = list(any)
}
variable "subnet_names" {
	type = list(any)
}
variable "agents_availability_zones" {
	type = list(any)
}
