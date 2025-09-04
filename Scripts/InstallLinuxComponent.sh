#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

# Install CloudWatch Agent
sudo yum install amazon-cloudwatch-agent -y

# Configure CloudWatch Agent
aws s3 cp s3://<bucket-name>/demo/config.json .           # S3 Bucket URI
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:/home/ec2-user/config.json

# Check CloudWatch Agent status
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a status

# # Cleanup installer
rm -f config.json

# sudo systemctl stop amazon-cloudwatch-agent
