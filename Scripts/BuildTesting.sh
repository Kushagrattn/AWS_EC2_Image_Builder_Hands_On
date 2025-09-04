#!/bin/bash
set -euo pipefail
set -x

# Function to check CloudWatch agent status via AWS CLI
check_cloudwatch_agent() {
    echo "Validating CloudWatch Agent status..."
    if sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a status | grep -E '"status":[[:space:]]*"running"'; then
        echo "[OK] CloudWatch agent running"
    else
        echo "[ERROR] CloudWatch agent NOT running"
        exit 1
    fi
}

echo "===== Build Validation Started ====="

# 1. Check CloudWatch Agent
check_cloudwatch_agent

echo "===== Build Validation Completed Successfully ====="
exit 0
