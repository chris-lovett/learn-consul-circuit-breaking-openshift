# Learn Consul - Circuit Breaking (OpenShift)

This repository configures an **existing OpenShift cluster** that already has **Consul Service Mesh** installed (Consul 1.22.3) to run a circuit breaking lab.

It **does not** provision infrastructure.

## Assumptions
- You are already logged in with `oc`/`kubectl` and have permissions to create namespaces and apply manifests.
- Consul is installed in namespace `consul`.
- Consul Connect injection is enabled (you mentioned it is set via Helm values). This repo also labels the app namespace to request injection.

## Quick start

Deploy the lab:

```bash
./scripts/check-prereqs.sh
./scripts/deploy.sh
```

Access the app UI locally:

```bash
oc -n circuitbreak port-forward svc/nginx 8080:80
# open http://localhost:8080
```

Reset / cleanup:

```bash
./scripts/destroy.sh
```

## What gets installed
- Namespace `circuitbreak`
- Demo services (nginx, frontend, public-api, product-api, product-api-db, payments, traffic-generator)
- Consul CRDs:
  - `ServiceDefaults` to declare protocols and apply upstream circuit breaker policy
  - `ServiceIntentions` to allow only expected service-to-service traffic

## Next
See `kustomize/` and `scripts/` for the full flow.

---

Derived from HashiCorp Education's `hashicorp-education/learn-consul-circuit-breaking`, rewritten for OpenShift existing clusters.
