#!/bin/bash

source ~/params.sh
echo "Logging in to the server....."

apic-slim login --username $USERNAME --password $PASSWORD --server $APIC_SERVER --realm provider/default-idp-2

echo "Publishing product...."

apic-slim products:publish --server $APIC_SERVER --org $ORG --catalog $POLICE product.yaml

echo "All done"

exit 0
