# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "mylinuxvm" {
    count = 4
    admin_username = "azureuser"
    admin_password = "Password@12345"
    disable_password_authentication = false
    location = azurerm_resource_group.Terraform_RG.location
    name = "sandylinuxvm-${count.index}"
    computer_name = "sandylinuxvm-${count.index}" # Hostname for the VM
    network_interface_ids = [ element(azurerm_network_interface.myvmnic[*].id, count.index) ]
    resource_group_name = azurerm_resource_group.Terraform_RG.name
    size = "Standard_DS1_v2"
    os_disk {
        name = "osdisk${count.index}"
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
    source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
    }
    custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
}