*** Work in Progress ***

# Prerequisites

You need to have a cfssl multirootca server running to issue certificate. See Ingress_and_API_certs_via_Cert_Manager.pdf doc for multirootca configuration and deployment.


Copy your the secret yaml file that contains your multirootca key:

```bash
cp source-crs/CfsslInternalCAKeySecret.yaml.example source-crs/CfsslInternalCAKeySecret.yaml
```

Then edit the file to put you own key

```bash
---
apiVersion: v1
kind: Secret
metadata:
  creationTimestamp: null
  name: cfssl-internal-ca-key
  namespace: cert-manager
data:
  key: "<PUT your multirootca key here!!!>" # <- HERE
```

Change your ClusterIssuer configuration file to point to your own multirootca server:

```bash
cp source-crs/CertManagerCfsslClusterIssuer.yaml.example source-crs/CertManagerCfsslClusterIssuer.yaml
```

Then edit the file to put your own multirootca url

```bash
---
apiVersion: cfssl-issuer.wikimedia.org/v1alpha1
kind: ClusterIssuer
metadata:
  name: cfssl-internal-ca
spec:
  authSecretName: "cfssl-internal-ca-key"
  bundle: false
  label: "default"
  profile: "host"
  url: "https://<YOUR multirootca server URL HERE!" # <- change HERE
```

# Test generated policies


Install kustomize PolicyGenTemplate plugin (see tools/install-kustomize-plugins.sh)

Then use 

```bash
../tools/run-kustomize.sh build .
```

to check policy.


