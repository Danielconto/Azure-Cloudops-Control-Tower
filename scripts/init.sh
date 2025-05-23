#!/bin/bash

set -e

ENVIRONMENT=${1:-dev}
cd "../environments/$ENVIRONMENT" || { echo "Environment not found"; exit 1; }

echo "Initializing Terraform for environment: $ENVIRONMENT"
terraform init
terraform validate
terraform providers lock

echo "Terraform initialization complete."
