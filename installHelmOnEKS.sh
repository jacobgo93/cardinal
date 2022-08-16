aws ecr get-login-password \
     --region eu-west-3 | helm registry login \
     --username AWS \
     --password-stdin 969342696885.dkr.ecr.eu-west-3.amazonaws.com

helm install ecr-chart-demo oci://969342696885.dkr.ecr.eu-west-3.amazonaws.com/helm-test-chart --version 0.1.0

## verify chart
helm list -n default

## verify ConfigMap
kubectl describe configmap helm-test-chart-configmap