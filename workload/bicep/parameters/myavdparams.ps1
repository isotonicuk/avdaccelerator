$avdVmLocalUserPassword = Read-Host -Prompt "Local user password" -AsSecureString
New-AzSubscriptionDeployment `
  -TemplateFile deploy-baseline.bicep `
  -TemplateParameterFile workload/bicep/parameters/deploy-baseline-parameters-example.json `
  -avdWorkloadSubsId "2820ff07-405a-49c6-b74b-d78825165e02" `
  -deploymentPrefix "AVD1" `
  -avdVmLocalUserName "avdadmin" `
  -avdVmLocalUserPassword $avdVmLocalUserPassword `
  -avdIdentityServiceProvider "AAD" `
  -existingHubVnetResourceId "<hubVnetResourceId>"  `
  -customDnsIps "<customDNSservers>"  `
  -avdEnterpriseAppObjectId "<wvdAppObjectId>" `
  -avdVnetPrivateDnsZone $true `
  -avdVnetPrivateDnsZoneFilesId "<PrivateDnsZoneFilesId>" `
  -avdVnetPrivateDnsZoneKeyvaultId "<PrivateDnsZoneKeyvaultId>" `
  -avdDeployMonitoring $true `
  -deployAlaWorkspace $true `
  -Location "eastus2"
