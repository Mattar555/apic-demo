#!/bin/bash

#source ~/params.sh
#echo $USERNAME
#echo $PASSWORD
#echo $APIC_SERVER
#echo $ORG
#echo $CATALOG
echo "Logging in to the server....."

apic-slim login --username leovidal --password meu1flamengo --server cpd-cp4i.nz-police-poc-e02a6b44bc9165598fc99ac3b2541da6-0000.au-syd.containers.appdomain.cloud/integration/apis/cp4i/medium --realm provider/default-idp-2

echo "Publishing product...."

apic-slim products:publish --server cpd-cp4i.nz-police-poc-e02a6b44bc9165598fc99ac3b2541da6-0000.au-syd.containers.appdomain.cloud/integration/apis/cp4i/medium  --org nz-police --catalog police product.yaml

echo "All done"

exit 0
