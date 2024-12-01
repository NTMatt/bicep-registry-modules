@description('Optional. The name of the backup vault.')
param name string = 'vault'

@description('Optional. Location of the backup vault.')
param location string = resourceGroup().location

@description('Conditional. The name of the parent NetApp account. Required if the template is used in a standalone deployment.')
param netAppAccountName string

@description('Optional. The list of backups to create.')
param backups backupType[]?

resource netAppAccount 'Microsoft.NetApp/netAppAccounts@2024-03-01' existing = {
  name: netAppAccountName
}

resource backupVault 'Microsoft.NetApp/netAppAccounts/backupVaults@2024-03-01' = {
  name: name
  parent: netAppAccount
  location: location
  properties: {}
}

module backupVault_backups 'backup/main.bicep' = [
  for (backup, index) in (backups ?? []): {
    name: '${uniqueString(deployment().name, location)}-ANF-Backup-${index}'
    params: {
      netAppAccountName: netAppAccount.name
      backupVaultName: backupVault.name
      name: backup.?name
      label: backup.?label
      snapshotName: backup.?snapshotName
      useExistingSnapshot: backup.?useExistingSnapshot
      volumeResourceId: backup.volumeResourceId
    }
  }
]

@description('The name of the backup vault.')
output name string = backupVault.name

@description('The Resource ID of the backup vault.')
output resourceId string = backupVault.id

@description('The name of the Resource Group the backup vault was created in.')
output resourceGroupName string = resourceGroup().name

@description('The location the resource was deployed into.')
output location string = backupVault.location

// ================ //
// Definitions      //
// ================ //

@export()
type backupType = {
  @description('Optional. The name of the backup.')
  name: string?

  @description('Optional. Label for backup.')
  label: string?

  @description('Optional. The name of the snapshot.')
  snapshotName: string?

  @description('Optional. Manual backup an already existing snapshot. This will always be false for scheduled backups and true/false for manual backups.')
  useExistingSnapshot: bool?

  @description('Required. ResourceId used to identify the Volume.')
  volumeResourceId: string
}
