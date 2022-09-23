#! /bin/bash

touch main.tf
touch variables.tf

mkdir modules
mkdir modules/instances
mkdir modules/storage

touch modules/instances/instances.tf
touch modules/instances/outputs.tf
touch modules/instances/variables.tf

touch modules/storage/storage.tf
touch modules/storage/outputs.tf
touch modules/storage/variables.tf
