*** Work in Progress ***

# Prerequisites

You need to have a cfssl multirootca server running to issue certificate. See Ingress_and_API_certs_via_Cert_Manager.pdf doc for multirootca configuration and deployment.


# Test generated policies


Install kustomize PolicyGenTemplate plugin (see tools/install-kustomize-plugins.sh)

Then use 

```bash
../tools/run-kustomize.sh build .
```

to check policy.


