#!/bin/bash
set -e

# Retrieve token with Heptio Authenticator
TOKEN=$(aws-iam-authenticator token -i ${var.cluster_name}| jq -r .status.token)

# Output token as JSON
jq -n --arg token "$TOKEN" '{"token": $token}'
