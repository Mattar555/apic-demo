# README


## Overview

As stated in the upper level README, the Jenkins script defined in "script.sh" is executed with each pipeline run.

Due to the simplicitly of this, we have not defined a Jenkinsfile defining the pipeline as it but a simple script execution.

Please ensure the prerequisites defined in the following section are met.


## Prerequisites

1) The apic-slim binary is present in your Jenkins server (including any prospective Jenkins workers).
2) Said binary added to the path for the user in question (typically the Jenkins user).
3) Network connectivity between the Jenkins worker nodes and the API Connect API Server.
4) An instance of an API Manager created. This is done from the Cloud Manager instance. The realm in question is found [here](https://www.ibm.com/docs/en/api-connect/10.0.1.x?topic=tool-logging-in-management-server#rapic_cli_login__determine_idp). The "USERNAME" and "PASSWORD" variables correspond to the aforementioned API Manager.
5) A provider organisation, along with a catalog created from the API Manager console.


## Procedure

Activate the Jenkins pipeline by updating either api.yaml or product.yaml. Note how product.yaml references api.yaml in the ref field.

For instance, you can update the rate limits and the gateway in product.yaml and api.yaml respectively.


