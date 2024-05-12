# Configure the GCP provider
provider "google" {
  project = "rich-ceiling-417808"
  region  = "us-east1"
  credentials = file(C:\Users\niky3\AppData\Roaming\gcloud)
}

# Define a variable for the CIDR range of your subnet
variable "subnet_cidr_range" {
  type = string
  default = "10.1.0.0/16"
}

# Define a variable for the name of your subnet
variable "subnet_name" {
  type = string
  default = "my-private-subnet"
}

# Create a VPC network (optional, if you don't have one already)
resource "google_compute_network" "vpc_network" {
  name = "my-vpc-network"
}

# Create a private subnet within the VPC network
resource "google_compute_subnetwork" "private_subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr_range
  region         = "us-east1"
  network       = google_compute_network.vpc_network.self_link

  # Optional: Configure private IP Google Access
  private_ip_google_access = true  # Allows VMs to access Google APIs without an external IP
}
