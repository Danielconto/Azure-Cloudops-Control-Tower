#!/bin/bash

set -e

ENVIRONMENT=${1:-dev}
cd "../environments/$ENVIRONMENT" || { echo "Environment not found"; exit 1; }

echo "Applying Terraform plan for environment: $ENVIRONMENT"

if [[ -f tfplan ]]; then
  terraform apply "tfplan"
else
  terraform apply -auto-approve
fi

echo "Terraform apply completed."
