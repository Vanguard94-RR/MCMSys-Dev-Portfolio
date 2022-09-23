Automating Infrastructure on Google Cloud with Terraform: Challenge Lab (GSP345)
Setup : Create the configuration files
Make the empty files and directories in Cloud Shell or the Cloud Shell Editor.

touch main.tf
touch variables.tf
mkdir modules
cd modules
mkdir instances
cd instances
touch instances.tf
touch outputs.tf
touch variables.tf
cd ..
mkdir storage
cd storage
touch storage.tf
touch outputs.tf
touch variables.tf
cd
Add the following to the each variables.tf file, and fill in the GCP Project ID:

variable "region" {
 default = "us-central1"
}

variable "zone" {
 default = "us-central1-a"
}

variable "project_id" {
 default = "<FILL IN PROJECT ID>"
}
Add the following to the main.tf file:

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.55.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}


module "instances" {
  source     = "./modules/instances"
}
Run "terraform init" in Cloud Shell in the root directory to initialize terraform.

terraform init

TASK 1: Import infrastructure
Navigate to Compute Engine > VM Instances. Click on tf-instance-1. Copy the Instance ID down somewhere to use later.
Navigate to Compute Engine > VM Instances. Click on tf-instance-2. Copy the Instance ID down somewhere to use later.
Next, navigate to modules/instances/instances.tf. Copy the following configuration into the file:

resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "n1-standard-1"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }

metadata_startup_script = <<-EOT
#!/bin/bash
EOT

allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "n1-standard-1"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }

metadata_startup_script = <<-EOT
#!/bin/bash
EOT

allow_stopping_for_update = true
}
To import the first instance, use the following command, using the Instance ID for tf-instance-1 you copied down earlier.

terraform import module.instances.google_compute_instance.tf-instance-1 <FILL IN INSTANCE 1 ID>
To import the second instance, use the following command, using the Instance ID for tf-instance-2 you copied down earlier.

terraform import module.instances.google_compute_instance.tf-instance-2 <FILL IN INSTANCE 2 ID>
The two instances have now been imported into your terraform configuration. You can now run the commands to update the state of Terraform. Type yes at the dialogue after you run the apply command to accept the state changes.

terraform plan
terraform apply

TASK 2: Configure a remote backend
Add the following code to the modules/storage/storage.tf file, and fill in the Bucket Name:

resource "google_storage_bucket" "storage-bucket" {
  name          = "<FILL IN BUCKET NAME>"
  location      = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}
Next, add the following to the main.tf file:

module "storage" {
  source     = "./modules/storage"
}
Run the following commands to initialize the module and create the storage bucket resource. Type yes at the dialogue after you run the apply command to accept the state changes.

terraform init
terraform apply
Next, update the main.tf file so that the terraform block looks like the following. Fill in your GCP Project ID for the bucket argument definition.

terraform {
  backend "gcs" {
    bucket  = "<FILL IN PROJECT ID>"
 prefix  = "terraform/state"
  }
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.55.0"
    }
  }
}
Run the following to initialize the remote backend. Type yes at the prompt.

terraform init

TASK 3: Modify and update infrastructure
Navigate to modules/instances/instance.tf. Replace the entire contents of the file with the following, and fill in your Instance 3 ID:

resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
}

resource "google_compute_instance" "<FILL IN INSTANCE 3 NAME>" {
  name         = "<FILL IN INSTANCE 3 NAME>"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
}
Run the following commands to initialize the module and create/update the instance resources. Type yes at the dialogue after you run the apply command to accept the state changes.

terraform init
terraform apply

TASK 4: Taint and destroy resources
Taint the tf-instance-3 resource by running the following command, and fill in your Instance 3 ID:

terraform taint module.instances.google_compute_instance.<FILL IN INSTANCE 3 NAME>
Run the following commands to apply the changes:

terraform init
terraform apply
Remove the tf-instance-3 resource from the instances.tf file. Delete the following code chunk from the file.

resource "google_compute_instance" "<FILL IN INSTANCE 3 NAME>" {
  name         = "<FILL IN INSTANCE 3 NAME>"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
}
Run the following commands to apply the changes. Type yes at the prompt.

terraform apply

TASK 5: Use a module from the Registry
Copy and paste the following to the end of main.tf file, fill in Version Number and Network Name instructed in the challenge:

module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> <FILL IN VERSION NUMBER>"

    project_id   = "qwiklabs-gcp-04-f2c1c01a09d3"
    network_name = "<FILL IN NETWORK NAME>"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-central1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-central1"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        }
    ]
}
Run the following commands to initialize the module and create the VPC. Type yes at the prompt.

terraform init
terraform apply
Navigate to modules/instances/instances.tf. Replace the entire contents of the file with the following:

resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "<FILL IN NETWORK NAME>"
    subnetwork = "subnet-01"
  }
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "<FILL IN NETWORK NAME>"
    subnetwork = "subnet-02"
  }
}
Run the following commands to initialize the module and update the instances. Type yes at the prompt.

terraform init
terraform apply

TASK 6: Configure a firewall
Add the following resource to the main.tf file, fill in the GCP Project ID and Network Name:

resource "google_compute_firewall" "tf-firewall" {
  name    = "tf-firewall"
 network = "projects/<FILL IN PROJECT_ID>/global/networks/<FILL IN NETWORK NAME>"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["web"]
  source_ranges = ["0.0.0.0/0"]
}
Run the following commands to configure the firewall. Type yes at the prompt.

terraform init
terraform apply