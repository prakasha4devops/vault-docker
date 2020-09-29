#!/usr/bin/env bash

cd $(dirname $0)

curl --header "X-Vault-Token: s.88TE4Pi3OPg4fb50pCSbEPIx" \
--request POST \
--data @createtoken.json \
-v \
http://192.168.0.13:9200/v1/auth/token/create-orphan