project_id = "your-project-id"
region = "your-gcp-region"
state_bucket = "your-state-bucket"
remote_access_cidrs = ["0.0.0.0/0"] # Can be locked down to Coalfire VPN if desired: 209.236.109.246/32 

ip_network_public     = "10.0.0.0/16"
ip_network_management = "10.1.0.0/16"
ip_network_private    = "10.2.0.0/16"

vpc_prefix      = "your-vpc-prefix"
subnet_prefix   = "your-subnet-prefix"
firewall_prefix = "your-firewall-prefix"

domain_name     = "your-domain-name"