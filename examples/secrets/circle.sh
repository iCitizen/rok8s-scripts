#!/bin/bash -ex

export SOPS_KMS_ARN=arn:aws:kms:us-east-1:111111111111:key/abcc1de5-6adc-446d-0000-10a65765aaa2

export S3_BUCKET=s3://ro-monitoring-secrets
export NAMESPACE=production

k8s-sops-secret-decrypt -f app.config
k8s-secrets-from-s3 -f app.config
k8s-deploy -f app.config
