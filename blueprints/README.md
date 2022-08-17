# Create a sandbox using Terraform:
A sandbox is a running functional application that contains all needed resources.
It composed out of a cloud infrastructure and may contain other dependant applications needed to run it.
This repository contains an example how to do it.

## Terraform modules:
[infra](../terraform-modules/sandbox-infra/) - This module generate all needed resources required by any application in the sandbox
[application](../terraform-modules/sandbox-application/) - This is an abstract module for creating any kind of app.
[Java-Spring](../terraform-modules/java-spring/) - This is a concrete application running a web server.
[guacamole](../terraform-modules/guacamole/) - This is the [Guacamole](https://guacamole.apache.org/) application designed to allow a secure access to debug other VMs run by a sandbox.
## Blueprint
[Java-Spring Blueprint](../blueprints/java-spring.yaml) - This is a blueprint making use of all of the previous Terraform modules.

