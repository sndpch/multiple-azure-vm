resource "azurerm_resource_group" "Terraform_RG" {
    name = "Terraform_RG"
    location = "westeurope"
    tags = {
      Environment = "Testing"
      Buildby = "Sandeep CH"
      Builddate = "20230211"
    }   
}