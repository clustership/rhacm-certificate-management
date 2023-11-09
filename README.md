# Automate certificate generation and deployment with ACM policies on a fleet of managed clusters

## Assumptions and pre-requesites

### Disclaimer

This is not a Red Hat supported solution. This document just provides an example of how RHACM (Red Hat Advanced Cluster Management) Policy Engine can be use to automate deployment of PKI generated certificates.

### Tools used

This example is based on the certified cert-manager operator deployed in managed OpenShift clusters. But I use an unsupported issuer (letsencrypt-digitalocean) to generate certificate using Letsencrypt public PKI with the alias challenge verification method using DNS TXT records generated using digitalocean API.

## Cert-manager installation and configuration (issuer and clusterissuer)

This is out of scope of this document.

## RHACM deployment

This is out of scope of this document.

## RHACM policies and placement rules

RHACM policies are wrapper resources around Kubernetes resources you want to apply to targeted managed clusters.
In the current case, we want Cert-manager CertificateRequest to be applied to all cluster to automatically generate trusted certificates for every managed clusters
that match specific PlacementRule (based on cluster labels).

As CertificateRequest are distinguished based on a domain (or cn) attribute unique to each cluster, we use a policy placeholder and RHACM lookup function to identify
this unique value for each managed cluster.

### PlacementRule definition


```bash
cat << EOF-

EOF

Use PolicyGenerator kustomize plugin (https://github.com/stolostron/policy-generator-plugin/tree/main)

Generate policy with:

```
kustomize build --enable-alpha-plugins . > ../policy-users-and-roles.yaml
```


