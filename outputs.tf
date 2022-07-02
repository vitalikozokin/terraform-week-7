output "password" {
  sensitive = true
  description = "password of machines"
  value = azurerm_linux_virtual_machine.vm["web1"].admin_password
}