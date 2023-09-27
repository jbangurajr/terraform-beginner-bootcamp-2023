# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our root module structure is as follows:

```md
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
```tf
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

## Fixing Tags

[How to Delete Local and Remote Tags on Git](https://devconnected.com/how-to-delete-local-and-remote-tags-on-git/)

Locall delete a tag

```sh
git tag -d <tag_name>
```

Remotely delete tag

```sh
git push --delete origin tagname
```

Checkout the commit that you want to retag. Grab the sha from your Github history.

```sh
git checkout <SHA>
git tag M.M.P
git push --tags
git checkout main
```

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

```tf
terraform apply -refresh-only -auto-approve
```

## Terraform Modules

### Terraform Module Structure

It is recommend to place modules in a `modules` directory when locally developing modules but you can name it whatever you like.

### Passing Input Variables

We can pass input variables to our module. The module has to declare the terraform variables in its own variables.tf

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

### Modules Sources

Using the source we can import the module from various places eg:

- locally
- Github
- Terraform Registry

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
}
```

[Modules Sources](https://developer.hashicorp.com/terraform/language/modules/sources)

## Considerations when using ChatGPT to write Terraform

LLMs such as ChatGPT may not be trained on the latest documentation or information about Terraform.

It may likely produce older examples that could be deprecated. Often affecting providers.

## Working with Files in Terraform

### Fileexists function

This is a built in terraform function to check the existance of a file.

```sh
condition = fileexists(var.error_html_filepath)
```
[Fileexists function](https://developer.hashicorp.com/terraform/language/functions/fileexists)

### Filemd5

Hashes the contents of a given file rather than a literal string.

[Filemd5](https://developer.hashicorp.com/terraform/language/functions/filemd5)

### Path Variable

In terraform there is a special variable called `path` that allows us to reference local paths:

- path.module = get the path for the current module

- path.root = get the path for the root module [Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)

```tf
resource "aws_s3_object" "index_html" { bucket = aws_s3_bucket.website_bucket.bucket key = "index.html" source = "${path.root}/public/index.html" }
```
## Terraform Locals

Locals allows us to define local variables. It can be very useful when we need transform data into another format and have referenced a varaible.

```tf
locals {
  s3_origin_id = "MyS3Origin"
}
```

[Local Values](https://developer.hashicorp.com/terraform/language/values/locals)


## Terraform Data Sources

This allows use to source data from cloud resources.

This is useful when we want to reference cloud resources without importing them.

```tf
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
```

[Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)

## Working with JSON

We use the jsonencode to create the json policy inline in the hcl.

```
> jsonencode({"hello"="world"})
{"hello":"world"}
```

[jsonencode](https://developer.hashicorp.com/terraform/language/functions/jsonencode)

### Changing the Lifecycle of Resources

[Meta Arguments Lifcycle](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)

## Terraform Data

Plain data values such as Local Values and Input Variables don't have any side-effects to plan against and so they aren't valid in replace_triggered_by. You can use terraform_data's behavior of planning an action each time input changes to indirectly use a plain value to trigger replacement.

[Terraform Data](https://developer.hashicorp.com/terraform/language/resources/terraform-data)

```tf
variable "revision" {
  default = 1
}

resource "terraform_data" "replacement" {
  input = var.revision
}

# This resource has no convenient attribute which forces replacement,
# but can now be replaced by any change to the revision variable value.
resource "example_database" "test" {
  lifecycle {
    replace_triggered_by = [terraform_data.replacement]
  }
}

```

## Provisioners

Provisioners allow you to execute commands on compute instances eg. a AWS CLI command.

They are not recommended for use by Hashicorp because Configuration Management tools such as Ansible are a better fit, but the functionality exists.

[Provisioners](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax)

### Local-exec

This will execute command on the machine running the terraform commands eg. plan apply

```tf
resource "aws_instance" "web" {
  # ...

  provisioner "local-exec" {
    command = "echo The server's IP address is ${self.private_ip}"
  }
}
```

[Local-exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec)

### Remote-exec

This will execute commands on a machine which you target. You will need to provide credentials such as ssh to get into the machine.

```tf
resource "aws_instance" "web" {
  # ...

  # Establishes connection to be used by all
  # generic remote provisioners (i.e. file/remote-exec)
  connection {
    type     = "ssh"
    user     = "root"
    password = var.root_password
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "puppet apply",
      "consul join ${aws_instance.web.private_ip}",
    ]
  }
}
```

[Remote-exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec)

### Heredoc

Heredoc refers to a special block of code that contains multi-line strings that will be redirected to a command.

[Heredoc](https://developer.hashicorp.com/terraform/language/expressions/strings#heredoc-strings)

