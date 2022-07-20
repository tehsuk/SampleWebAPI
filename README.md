# SampleWebAPI
A small sample web api with tests, for playing around with CI tools

# Deployment instructions
You will need:
- An azure account
- An azure devops account
- a service principal with owner permissions in azure
- personal access tokens created for your github & azure devops accounts
- terraform

Steps:
- Clone this repo
- Set the ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_SUBSCRIPTION_ID, ARM_TENANT_ID environment variables for your ARM account.
- create a terraform.tfvars with authentication information. see example file
- run terraform apply
- grab a coffee or two.  when you come back a build pipeline should be available to deploy the app to aks