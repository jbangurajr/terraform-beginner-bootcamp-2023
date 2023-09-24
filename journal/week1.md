# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our root module structure is as follows:

```
PROJECT_ROOT
│
├── main.tf                 # everything else.
├── variables.tf            # stores the structure of input variables
├── terraform.tfvars        # the data of variables we want to load into our terraform project
├── providers.tf            # defined required providers and their configuration
├── outputs.tf              # stores our outputs
└── README.md               # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables

### Terraform Cloud Variables

In terraform we can set two kind of variables:

- Enviroment Variables - those you would set in your bash terminal eg. AWS credentials
- Terraform Variables - those that you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensitive so they are not shown visibliy in the UI.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag

We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_uuid="my-user_uuid"`

### var-file flag
This flag is used to specify a file containing variable values. You can define your variables and their values in a separate variable file (commonly with a `.tfvars` extension) and then use the `-var-file` flag to load these values into your Terraform configuration. For example:
```
terraform apply -var-file="my-vars.tfvars"
```

### terraform.tvfars
This is the default file to load in terraform variables in blunk

### auto.tfvars

Terraform will automatically read the values from the `auto.tfvars` file and use them as default values for your variables unless overridden by values provided through other means. Using `auto.tfvars` can make it convenient to set default values for your variables without needing to specify them on the command line every time you run Terraform.

### Order of precedence for terraform variables

In Terraform, variable values can be set in various ways, and Terraform follows a specific order of precedence when determining the final value of a variable. Here's the order of precedence, from highest to lowest:

1. **Command-Line Flags:** Values provided via command-line flags take the highest precedence. When you run `terraform apply` or `terraform plan` and use the `-var` or `-var-file` flag to specify a variable's value, that value will override any other settings.

2. **Environment Variables:** If a variable is not set using command-line flags, Terraform will check for corresponding environment variables. Terraform follows a naming convention for environment variables where a variable named `TF_VAR_variable_name` corresponds to a variable named `variable_name` in your configuration.

3. **Variable Files:** You can specify a variable file using the `-var-file` flag. Values from the variable file will be used unless overridden by command-line flags or environment variables.

4. **Default Values (in Configuration Files):** If a variable is not set through any of the above methods, Terraform will use the default value defined in the variable block within the Terraform configuration file (`.tf` file).

5. **Implicit Values (for sensitive variables):** If a variable is marked as sensitive using the `sensitive` argument in the variable block, Terraform will not show or log its value. You can still set these sensitive variables using the above methods, but their values will not be displayed in logs or plan output.

6. **Variable Expressions (Computed Values):** In some cases, variables may be computed or derived within your configuration using expressions or functions. These computed values are evaluated at runtime based on other variables or data sources.

## Dealing With Configuration Drift


## What happens if we lose our state file?

If you lose your statefile, you most likley have to tear down all your cloud infrastructure manually.

You can use terraform import but it won't for all cloud resources. You need check the terraform providers documentation for which resources support import.

### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.bucket bucket-name`

[Terraform Import [AWS S3 Bucket Import]](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

### Fix Manual Configuration
If someone goes and delete or modifies cloud resource manually through ClickOps.

If we run Terraform plan is with attempt to put our infrstraucture back into the expected state fixing Configuration Drift

## Fix using Terraform Refresh

```
terraform apply -refresh-only -auto-approve
```