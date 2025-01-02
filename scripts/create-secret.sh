#!/bin/bash
kubectl create secret generic db-credentials \
  --from-literal=username=myuser \
  --from-literal=password='P@ssw0rd!2023' \
  --from-literal=database=postgres
