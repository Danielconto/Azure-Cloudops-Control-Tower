output "vm_id" {
  description = "ID of the single Linux virtual machine"
  value       = azurerm_linux_virtual_machine.example.id
}

output "vmss_id" {
  description = "ID of the virtual machine scale set"
  value       = azurerm_virtual_machine_scale_set.example.id
}
