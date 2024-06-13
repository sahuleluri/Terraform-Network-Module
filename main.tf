#Vpc-Module
module "vpc_module" {
  source    = "./Vpc_module"
  vpc_cidr_blocks = "10.0.0.0/16"
  vpc-name = "Tree-Greens-vpc"
}


#PubSubnetModule
module "Pubsubnet_module" {
  source = "./Subnet_module/public_subnet"
  subnet_cidr_blocks = [
    "10.0.3.0/24",
    "10.0.4.0/24"
  ]

  Pubsubnet_name_tags = [
    "PublicSubnet1",
    "PublicSubnet2"
  ]

  vpc_id = module.vpc_module.vpc_id # Use vpc_id directly from the VPC module

  pubavailability_zone = ["ap-south-1a", "ap-south-1b"]

  depends_on = [module.vpc_module]
}

#NatGateway-Module
module "nat_gateway" {
  source = "./NatGateway"

  # Only create NAT gateway on the first subnet
  nat_subnet_ids = [module.Pubsubnet_module.subnet_ids[0]]

  depends_on = [module.Pubsubnet_module]
}



#InternetGateway-Module
module "InternetGateway_module" {
  source = "./InternetGateway"

  vpc_id = module.vpc_module.vpc_id
  internet_gateway_Name = "Internet-Gateway" 

  # Depend on the vpc_module to ensure it's created before creating subnets
  depends_on = [module.vpc_module]
}



#PublicRT_module
module "PublicRT_module" {
  source = "./RouteTable_module/Public-RT"

  # Pass the default_route_table_id to the module
  default_route_table_id = module.vpc_module.default_route_table_id
  publicRT_Name = "Public-RT" 

  # Pass the internet_gateway_id to the module
  internet_gateway_id = module.InternetGateway_module.internet_gateway_id
  pubroutes = [
  {
    cidr_block = "0.0.0.0/0"  # Example CIDR block for internet access
    gateway_id = module.InternetGateway_module.internet_gateway_id
  },
  # {
  #   cidr_block = "10.1.0.0/16"
  #   gateway_id = "local"
  # },
  # Add more routes as needed
]

  # Depend on the vpc_module to ensure it's created before creating subnets
  depends_on = [
    module.vpc_module,
    module.InternetGateway_module
  ]

}


#PrivateRT_module
module "PrivateRT_module" {
  source = "./RouteTable_module/Private-RT"

  vpc-id = module.vpc_module.vpc_id
  privateRT-name = "Private-RT" 
  pvtroutes = [
  {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  },
  {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.nat_gateway.nat_gateway_id
  },
  # Add more routes as needed
]


  # Depend on the vpc_module to ensure it's created before creating subnets
  depends_on = [
    module.vpc_module,
    module.nat_gateway
  ]
}

#PvtSubnet-Module
module "Pvtsubnet_module" {
  source = "./Subnet_module/private_subnet"

  pvtsubnet_cidr_blocks = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  subnet_name_tags = [
    "PrivateSubnet1",
    "PrivateSubnet2"
  ]

  vpc_id = module.vpc_module.vpc_id # Use vpc_id directly from the VPC module

  pvtavailability_zone = ["ap-south-1a", "ap-south-1b"]

  Pvt_RT_Id = module.PrivateRT_module.route_table_id
  depends_on = [
    module.vpc_module,
    module.PrivateRT_module
  ]
}






