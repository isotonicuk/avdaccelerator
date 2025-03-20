using './deploy-baseline.bicep'

param deploymentPrefix = 'AVD1'
param deploymentEnvironment = 'Dev'
param diskEncryptionKeyExpirationInDays = 60
param avdSessionHostLocation = ''
param avdManagementPlaneLocation = ''
param avdWorkloadSubsId = ''
param avdServicePrincipalObjectId = ''
param avdArmServicePrincipalObjectId = ''
param avdVmLocalUserName = ''
param avdVmLocalUserPassword = ''
param avdIdentityServiceProvider = 'ADDS'
param createIntuneEnrollment = false
param avdSecurityGroups = []
param identityDomainName = 'none'
param identityDomainGuid = ''
param avdDomainJoinUserName = 'none'
param avdDomainJoinUserPassword = 'none'
param avdOuPath = ''
param avdHostPoolType = 'Pooled'
param hostPoolPreferredAppGroupType = 'Desktop'
param hostPoolPublicNetworkAccess = 'Enabled'
param workspacePublicNetworkAccess = 'Enabled'
param avdPersonalAssignType = 'Automatic'
param avdHostPoolLoadBalancerType = 'BreadthFirst'
param hostPoolMaxSessions = 8
param avdStartVmOnConnect = true
param avdHostPoolRdpProperties = 'audiocapturemode:i:1;audiomode:i:0;drivestoredirect:s:;redirectclipboard:i:1;redirectcomports:i:1;redirectprinters:i:1;redirectsmartcards:i:1;screen mode id:i:2'
param avdDeployScalingPlan = true
param createAvdVnet = true
param existingVnetAvdSubnetResourceId = ''
param existingVnetPrivateEndpointSubnetResourceId = ''
param existingHubVnetResourceId = ''
param avdVnetworkAddressPrefixes = '10.10.0.0/16'
param vNetworkAvdSubnetAddressPrefix = '10.10.1.0/24'
param vNetworkPrivateEndpointSubnetAddressPrefix = '10.10.2.0/27'
param customDnsIps = ''
param deployDDoSNetworkProtection = false
param deployPrivateEndpointKeyvaultStorage = true
param deployAvdPrivateLinkService = false
param createPrivateDnsZones = true
param avdVnetPrivateDnsZoneConnectionResourceId = ''
param avdVnetPrivateDnsZoneDiscoveryResourceId = ''
param avdVnetPrivateDnsZoneFilesId = ''
param avdVnetPrivateDnsZoneKeyvaultId = ''
param vNetworkGatewayOnHub = false
param createAvdFslogixDeployment = true
param createAppAttachDeployment = false
param fslogixFileShareQuotaSize = 1
param appAttachFileShareQuotaSize = 1
param avdDeploySessionHosts = true
param deployGpuPolicies = false
param avdDeployMonitoring = false
param deployAlaWorkspace = true
param deployCustomPolicyMonitoring = false
param avdAlaWorkspaceDataRetention = 90
param alaExistingWorkspaceResourceId = ''
param avdDeploySessionHostsCount = 1
param avdSessionHostCountIndex = 1
param availability = 'None'
param availabilityZones = [
  '1'
  '2'
  '3'
]
param zoneRedundantStorage = false
param fslogixStoragePerformance = 'Premium'
param appAttachStoragePerformance = 'Premium'
param diskZeroTrust = false
param avdSessionHostsSize = 'Standard_D4ads_v5'
param avdSessionHostDiskType = 'Premium_LRS'
param customOsDiskSizeGB = 0
param enableAcceleratedNetworking = true
param securityType = 'TrustedLaunch'
param secureBootEnabled = true
param vTpmEnabled = true
param useSharedImage = false
param mpImageOffer = 'Office-365'
param mpImageSku = 'win11-24h2-avd-m365'
param avdCustomImageDefinitionId = ''
param managementVmOsImage = 'winServer_2022_Datacenter_smalldisk_g2'
param storageOuPath = ''
param avdUseCustomNaming = false
param avdServiceObjectsRgCustomName = 'rg-avd-app1-dev-use2-service-objects'
param avdNetworkObjectsRgCustomName = 'rg-avd-app1-dev-use2-network'
param avdComputeObjectsRgCustomName = 'rg-avd-app1-dev-use2-pool-compute'
param avdStorageObjectsRgCustomName = 'rg-avd-app1-dev-use2-storage'
param avdMonitoringRgCustomName = 'rg-avd-dev-use2-monitoring'
param avdVnetworkCustomName = 'vnet-app1-dev-use2-001'
param avdAlaWorkspaceCustomName = 'log-avd-app1-dev-use2'
param avdVnetworkSubnetCustomName = 'snet-avd-app1-dev-use2-001'
param privateEndpointVnetworkSubnetCustomName = 'snet-pe-app1-dev-use2-001'
param avdNetworksecurityGroupCustomName = 'nsg-avd-app1-dev-use2-001'
param privateEndpointNetworksecurityGroupCustomName = 'nsg-pe-app1-dev-use2-001'
param avdRouteTableCustomName = 'route-avd-app1-dev-use2-001'
param privateEndpointRouteTableCustomName = 'route-pe-app1-dev-use2-001'
param avdApplicationSecurityGroupCustomName = 'asg-app1-dev-use2-001'
param avdWorkSpaceCustomName = 'vdws-app1-dev-use2-001'
param avdWorkSpaceCustomFriendlyName = 'App1 - Dev - East US 2 - 001'
param avdHostPoolCustomName = 'vdpool-app1-dev-use2-001'
param avdHostPoolCustomFriendlyName = 'App1 - Dev - East US 2 - 001'
param avdScalingPlanCustomName = 'vdscaling-app1-dev-use2-001'
param avdApplicationGroupCustomName = 'vdag-desktop-app1-dev-use2-001'
param avdApplicationGroupCustomFriendlyName = 'Desktops - App1 - Dev - East US 2 - 001'
param avdSessionHostCustomNamePrefix = 'vmapp1duse2'
param storageAccountPrefixCustomName = 'st'
param fslogixFileShareCustomName = 'fslogix-pc-app1-dev-use2-001'
param appAttachFileShareCustomName = 'appa-app1-dev-use2-001'
param avdWrklKvPrefixCustomName = 'kv-sec'
param ztDiskEncryptionSetCustomNamePrefix = 'des-zt'
param ztKvPrefixCustomName = 'kv-key'
param createResourceTags = false
param workloadNameTag = 'Contoso-Workload'
param workloadTypeTag = 'Light'
param dataClassificationTag = 'Non-business'
param departmentTag = 'Contoso-AVD'
param workloadCriticalityTag = 'Low'
param workloadCriticalityCustomValueTag = 'Contoso-Critical'
param applicationNameTag = 'Contoso-App'
param workloadSlaTag = 'Contoso-SLA'
param opsTeamTag = 'workload-admins@Contoso.com'
param ownerTag = 'workload-owner@Contoso.com'
param costCenterTag = 'Contoso-CC'
param time = ? /* TODO : please fix the value assigned to this parameter `utcNow()` */
param enableTelemetry = true
param enableKvPurgeProtection = true
param deployAntiMalwareExt = true
param customStaticRoutes = []
param deployDefender = false
param enableDefForServers = true
param enableDefForStorage = true
param enableDefForKeyVault = true
param enableDefForArm = true

