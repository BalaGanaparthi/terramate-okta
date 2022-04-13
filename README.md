# About

This project servers as a starter for using [Terraform](https://www.terraform.io/) to manage Okta configurations

[Terraform Workspaces](https://www.terraform.io/language/state/workspaces) are used in the project to show how the same configurations can be applied to multiple tenants by keeping each tenants [tfstate](https://www.terraform.io/language/state) file isolated from other tenants state file.

The project assumes the following workspaces (Three tenants, one for each environment)

| Workspace |
| :---      |
| DEV       |
| PREPROD   |
| PROD      |

The project contains three local modules and make use of [Okta's Terraform Provider](https://registry.terraform.io/providers/okta/okta/latest/docs)

| Module Name                   | Module Description                    |
| :---                          | :---                                  |
| Users                         | Manage Okta Users                     |
| Groups                        | Manage Okta Grups                     |
| user_groups                   | Manage User to Group mapping          | 
| group_roles                   | Manage Group to Role mapping          | 
| applications                  | Manage Okta Applications              |
| app_signon_policies           | Manage App signon policies            | 
| authenticators                | Manage Authenticators                 | 
| mfa_enrollment_policies       | Manage mfa enrollment policies        |
| mfa_enrollment_policies_rules | Manage mfa enrollment policy Rules    |

Terraform state file is stored locally however the state file can be managed [remotely](https://www.terraform.io/language/state/remote)  

Input files for each local module are located at `terraform/input_files/${terraform.workspace}/*.csv` as a .csv file. Where `${terraform.workspace}` is the current workspace

Rename `terraform/env_template` to  `terraform/env`

Each tenant's [Okta provider configuration](https://registry.terraform.io/providers/okta/okta/latest/docs) details are located at `terraform/input_files/${terraform.workspace}/.env`

[Terraform Docker Container](https://hub.docker.com/r/hashicorp/terraform) is used and separate install of Terraform is not required. However the steps can also be executed with standalone Terraform 

Install Docker by downloading from [Docker Desktop download page](https://www.docker.com/products/docker-desktop)

# Usage

## Initialize Terraform

Execute the command from the root folder of the project (same folder where docker-compose.yal exist
)
```bash
docker-compose up 
```
or
```bash
docker-compose run --rm terraform init
```
This will initialize the terraform by downloading required providers and modules for executing the Terraform (HCL) scripts
As a result of executing the command, a new folder `.terraform` will be created with required modules and providers downloaded

## Set environment variables for each workspace
Set the environment variables with the okta providers details in `terraform/env/${terraform.workspace}/.env`
```.env
TF_WORKSPACE=DEV
#
TF_LOG=WARN
TF_LOG_PATH=logs/tf.warn
#
OKTA_ORG_NAME=tenantName
OKTA_BASE_URL=oktapreview.com
OKTA_API_TOKEN=000Ru9TOFKHwlmYWXjRzsZBSGPihESFZPJQKLj0t7j
```

## Create required workspaces

### Create DEV workspace
```bash
export TF_WORKSPACE=DEV
docker-compose run --rm terraform workspace new DEV
```
This will create a folder `terraform.tfstate.d/DEV`
The tfstate file for the DEV workspace will be saved at `terraform.tfstate.d/DEV/terrafroem.tfstate` folder

### Create PREPROD workspace
```bash
export TF_WORKSPACE=PREPROD
docker-compose run --rm terraform workspace new PREPROD
```
This will create a folder `terraform.tfstate.d/PREPROD`
The tfstate file for the PREPROD workspace will be saved at `terraform.tfstate.d/PREPROD/terrafroem.tfstate` folder

### Create PROD workspace
```bash
export TF_WORKSPACE=PROD
docker-compose run --rm terraform workspace new PROD
```
This will create a folder `terraform.tfstate.d/PROD`
The tfstate file for the PROD workspace will be saved at `terraform.tfstate.d/PROD/terrafroem.tfstate` folder


## Select a workspace 

docker-compose.yml uses environmnet file located at `terraform/input_files/${TF_WORKSPACE}/.env` and the workspace variable is provided by setting an environment variable. 
- Setting the workspace name as environment variable helps Docker to choose a correct .env file 
- Each .env files sets the Terraform's workspace by a [TF_WORKSPACE environment variable](https://www.terraform.io/cli/config/environment-variables#tf_workspace) as a hardcoded value

### Select DEV workspace
```bash
export TF_WORKSPACE=DEV
```

### Select PREPROD workspace
```bash
export TF_WORKSPACE=PREPROD
```

### Select PROD workspace
```bash
export TF_WORKSPACE=PROD
```

## Execute Terraform Commands

**Note** : It's important to set the workspace prior to executing Terraform commands

### Execute Terraform Plan
```bash
docker-compose run --rm  terraform plan
```

### Execute terraform apply
```bash
# first execute
docker-compose run --rm terraform apply -auto-approve -target=module.mfa_enrollment_policies

# and then execute 
docker-compose run --rm terraform apply -auto-approve
```

### Execute terraform apply for a specific target
```bash
docker-compose run --rm terraform apply -target module.users -auto-approve -refresh=true
```

### Execute terraform destroy
```bash
docker-compose run --rm terraform destroy
```