#!/bin/bash

set -e

ENVIRONMENT=${1:-dev}
cd "../environments/$ENVIRONMENT" || { echo "Environment not found"; exit 1; }

echo "Destroying Terraform-managed resources in $ENVIRONMENT"
read -p "Are you sure? This will delete everything in $ENVIRONMENT (yes/no): " confirm
if [[ "$confirm" != "yes" ]]; then
  echo "Aborted by user."
  exit 1
fi

terraform destroy -auto-approve

echo "Terraform destroy completed."
