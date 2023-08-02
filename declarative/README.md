# Overview


## Procedure

First, follow the steps given [here](https://www.ibm.com/docs/en/cloud-paks/cp-integration/2023.2?topic=integrations-using-declarative-apis)


### Procedure - Secret

The secret needs to be created first. So follow the steps provided. Ensure the username and password fields are correct.

The certificate at this time of writing does not seem to include the host name (as extracted from the ManagementCluster instance) and as such, is not going to be trusted when attempting to upload the API definition to the API manager. More on this in the appendix section.

### Procedure - Definition

Now, as given in [this](https://www.ibm.com/docs/en/cloud-paks/cp-integration/2023.2?topic=integrations-using-declarative-apis#create-an-api-with-the-cli__title__1) section. You either create one of the following for the spec.defintion field of the API object:

1) configmap
2) external
3) integrationRuntime


We use configmap here. The data enclosed within should contain the API specification desired. A sample api (and enclosing product) is found within the top directory. Notice how the spec portion ofthe configmap.data coincides with the api definition.

Simply obtain the api spec and perform the following:

```
kubectl create configmap my-config --from-file=path/to/file/here
```

Once the configmap and secret are ready, simply create the API object as given in the link above, performing the substitutions where appropriate. Do not forget to place the correct providerOrganisation also.


## Appendix

Following the steps above will result in the folloiwng warning. This is seen when attempting to describe the Custom Resource from a K8 perspective.


```
Warning  CannotCreateDraftAPI  116s  ibm-integration-platform-navigator-operator  Failed to create draft API due to error: Post "https://cpd-cp4i.nz-police-poc-e02a6b44bc9165598fc99ac3b2541da6-0000.au-syd.containers.appdomain.cloud/integration/apis/cp4i/medium/api/api/token": tls: failed to verify certificate: x509: certificate is valid for internal-nginx-svc, *.svc.cluster.local, api-svc, *.api, ibm-nginx-svc, zen-core-api, not cpd-cp4i.nz-police-poc-e02a6b44bc9165598fc99ac3b2541da6-0000.au-syd.containers.appdomain.cloud
```

As such, the only way to get around this is to either use a globally trusted CA (as opposed to self signed certs) or reference the actual service object as opposed to the host dns. I have not tried this, but it should work because the DNS resolution is performed within the cluster and so should work.
