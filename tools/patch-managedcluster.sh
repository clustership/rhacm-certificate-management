oc patch managedcluster sno-03 --type json -p '[{"op": "add", "path": "/metadata/labels", "value": {"cert-manager": "true"}}]'
