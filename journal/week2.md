# Terraform Beginner Bootcamp 2023 - Week 2

## Working with Ruby

### Bundler

Bundler is a package manager for runy. It is the primary way to install ruby packages (known as gems) for ruby.

#### Install Gems

You need to create a Gemfile and define your gems in that file.

```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Then you need to run the `bundle install` command

This will install the gems on the system globally (unlike nodejs which install packages in place in a folder called node_modules)

A Gemfile.lock will be created to lock down the gem versions used in this project.

#### Executing ruby scripts in the context of bundler

We have to use `bundle exec` to tell future ruby scripts to use the gems we installed. This is the way we set context.

### Sinatra

Sinatra is a micro web-framework for ruby to build web-apps.

Its great for mock or development servers or for very simple projects.

You can create a web-server in a single file.

[Sinatra Ruby](https://sinatrarb.com/)

## Terratowns Mock Server

### Running the web server

We can run the web server by executing the following commands:

```rb
bundle install
bundle exec ruby server.rb
```

All of the code for our server is stored in the `server.rb` file.

## Custom Terraform Providers

### Create rc file

The primary purpose of the terraform.rc file in Terraform is to override default settings and specify where to look for custom providers.

[Terraform Local Providers and Registry Mirror Configuration](https://servian.dev/terraform-local-providers-and-registry-mirror-configuration-b963117dfffa)

### Create main.go file

The contents of the main function consume the Plugin SDK's plugin library which facilitates the RPC communication between Terraform Core and the plugin.

[Setup and implement read](https://developer.hashicorp.com/terraform/tutorials/providers/provider-setup)


### Add Provider Block

Defining a function `providerConfigure`, typically used in Terraform providers to configure the provider's settings and initialize the provider with those settings.

#### Test the provider

`./bin/build_provider`

### Test the provider


Use `go mod init` to initialize the directory for a terraform provider in Go

```go
go build -o terraform-provider-terratowns_v1.0.0
```

### Add Resource Blocks
Using CRUD

```go
ResourcesMap:  map[string]*schema.Resource{
			"terratowns_home": Resource(),
		},
```

```go
func Resource() *schema.Resource {
	resource := &schema.Resource{
		CreateContext: resourceHouseCreate,
		ReadContext: resourceHouseRead,
		UpdateContext: resourceHouseUpdate,
		DeleteContext: resourceHouseDelete,
		Schema: map[string]*schema.Schema{
			"name": {
				Type: schema.TypeString,
				Required: true,
				Description: "Name of home",
			},
```
## CRUD

Terraform Provider resources utilize CRUD.

CRUD stands for Create, Read Update, and Delete

[Perform CRUD operations with providers](https://developer.hashicorp.com/terraform/tutorials/providers/provider-use)

https://en.wikipedia.org/wiki/Create,_read,_update_and_delete
