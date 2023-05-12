# citus-helm-charts

## Quickstart

To install this helm chart remotely (using helm 3)

```bash
helm upgrade patroni-citus patroni-citus --values patroni-citus/values.yaml --namespace citus-demo --create-namespace --install --force  --debug
```
To debug helm chart
```
helm template patroni-citus --values patroni-citus/values.yaml --output-dir patroni-citus-template --namespace patroni-citus --debug
```