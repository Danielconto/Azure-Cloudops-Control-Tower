#!/bin/bash

set -e

ENVIRONMENT=${1:-dev}
cd "../environments/$ENVIRONMENT" || { echo "Environment not found"; exit 1; }

echo "Running Terraform plan for environment: $ENVIRONMENT"
terraform validate
terraform plan -out=tfplan

echo "Plan created and saved to 'tfplan'"
