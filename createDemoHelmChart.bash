helm create helm-test-chart
rm -rf ./helm-test-chart/templates/*

cd helm-test-chart/templates

cat <<EOF > configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: helm-test-chart-configmap
data:
  myvalue: "Hello World"
EOF

cd ../..
helm package helm-test-chart

aws ecr create-repository \
     --repository-name helm-test-chart \
     --region eu-west-3

aws ecr get-login-password \
     --region eu-west-3 | helm registry login \
     --username AWS \
     --password-stdin 969342696885.dkr.ecr.eu-west-3.amazonaws.com

helm push helm-test-chart-0.1.0.tgz oci://969342696885.dkr.ecr.eu-west-3.amazonaws.com/

## verify
aws ecr describe-images \
     --repository-name helm-test-chart \
     --region eu-west-3
