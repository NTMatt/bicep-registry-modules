# Function app module

Module to create function app for your application

## Description

This is a low-level Bicep module for managing Azure Functions, it supports an array of function, also the user has the option to either choose use user assigned identity or system assigned identity and also support the storage account to be in different resource group.

## Parameters

| Name                              | Type     | Required | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| :-------------------------------- | :------: | :------: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `name`                            | `string` | Yes      | Required. Name for the Azure Function App.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| `location`                        | `string` | Yes      | Required. Location for all resources.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `tags`                            | `object` | No       | Optional. Tags for all resources within Azure Function App module.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `sku`                             | `object` | No       | Required. Defines the name, tier, size, family and capacity of the app service plan.                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `serverOS`                        | `string` | No       | Optional. Kind of server OS.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `perSiteScaling`                  | `bool`   | No       | Optional. If true, apps assigned to this app service plan can be scaled independently. If false, apps assigned to this app service plan will scale to all instances of the plan.                                                                                                                                                                                                                                                                                                                                                                         |
| `maximumElasticWorkerCount`       | `int`    | No       | Optional. Maximum number of total workers allowed for this ElasticScaleEnabled app service plan.                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `targetWorkerCount`               | `int`    | No       | Optional. Scaling worker count.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| `targetWorkerSizeId`              | `int`    | No       | Optional. The instance size of the hosting plan (small, medium, or large).                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| `identityType`                    | `string` | No       | Optional. The type of identity used for the virtual machine. The type 'SystemAssigned, UserAssigned' includes both an implicitly created identity and a set of user assigned identities. The type 'None' will remove any identities from the sites ( app or functionapp).                                                                                                                                                                                                                                                                                |
| `userAssignedIdentityId`          | `string` | No       | Optional. Specify the resource ID of the user assigned Managed Identity, if 'identity' is set as 'UserAssigned'.                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `httpsOnly`                       | `bool`   | No       | Optional. Configures a site to accept only HTTPS requests. Issues redirect for HTTP requests.                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| `appServiceEnvironmentId`         | `string` | No       | Optional. The resource ID of the app service environment to use for this resource.                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `clientAffinityEnabled`           | `bool`   | No       | Optional. If client affinity is enabled.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `kind`                            | `string` | No       | Required. Type of site to deploy.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `functionsExtensionVersion`       | `string` | No       | Optional. Version of the function extension.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `functionAppEditMode`             | `string` | No       | Dictates whether editing in the Azure portal is enabled.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `functionsWorkerRuntime`          | `string` | No       | Optional. Runtime of the function worker. WARNING: NOT ALL OSes SUPPORT ALL RUNTIMES!                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `functionsDefaultNodeversion`     | `string` | No       | Optional. NodeJS version.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `publicNetworkAccessForIngestion` | `string` | No       | Optional. The network access type for accessing Application Insights ingestion. - Enabled or Disabled.                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `publicNetworkAccessForQuery`     | `string` | No       | Optional. The network access type for accessing Application Insights query. - Enabled or Disabled.                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `appInsightsType`                 | `string` | No       | Optional. Application type.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `appInsightsKind`                 | `string` | No       | Optional. The kind of application that this component refers to, used to customize UI.                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `enableInsights`                  | `bool`   | No       | Optional. Enabled or Disable Insights for Azure functions.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| `workspaceResourceId`             | `string` | No       | Optional. Resource ID of the log analytics workspace which the data will be ingested to, if enableaInsights is false.                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `functions`                       | `array`  | No       | Optional. List of Azure function (Actual object where our code resides).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `enableVnetIntegration`           | `bool`   | No       | Optional. Enable Vnet Integration or not.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `subnetId`                        | `string` | No       | Optional. The subnet that will be integrated to enable vnet Integration.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `enableSourceControl`             | `bool`   | No       | Optional. Enable Source control for the function.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `repoUrl`                         | `string` | No       | Optional. Repository or source control URL.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `branch`                          | `string` | No       | Optional. Name of branch to use for deployment.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| `storageAccountName`              | `string` | Yes      | Required. Name of the storage account used by function app.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `isManualIntegration`             | `bool`   | No       | Optional. to limit to manual integration; to enable continuous integration (which configures webhooks into online repos like GitHub).                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `isMercurial`                     | `bool`   | No       | Optional. true for a Mercurial repository; false for a Git repository.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `storgeAccountResourceGroup`      | `string` | Yes      | Required. Resource Group of storage account used by function app.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `enablePackageDeploy`             | `bool`   | No       | Optional. True to deploy functions from zip package. "functionPackageUri" must be specified if enabled. The package option and sourcecontrol option should not be enabled at the same time.                                                                                                                                                                                                                                                                                                                                                              |
| `functionPackageUri`              | `string` | No       | Optional. URI to the function source code zip package, must be accessible by the deployer. E.g. A zip file on Azure storage in the same resource group.                                                                                                                                                                                                                                                                                                                                                                                                  |
| `enableDockerContainer`           | `bool`   | No       | Optional. Enable docker image deployment.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `dockerImage`                     | `string` | No       | Optional. This will be required when enableDockerContainer passed as true.                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| `extraAppSettings`                | `object` | No       | Optional. Extra app settings that should be provisioned while creating the function app. Note! Settings below should not be included unless absolutely necessary, because settings in this param will override the ones added by the module:<br />AzureWebJobsStorage<br />AzureWebJobsDashboard<br />WEBSITE_CONTENTSHARE<br />WEBSITE_CONTENTAZUREFILECONNECTIONSTRING<br />FUNCTIONS_EXTENSION_VERSION<br />FUNCTIONS_WORKER_RUNTIME<br />WEBSITE_NODE_DEFAULT_VERSION<br />APPINSIGHTS_INSTRUMENTATIONKEY<br />APPLICATIONINSIGHTS_CONNECTION_STRING |
| `ftpsState`                       | `string` | No       | The state of FTP / FTPS service.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `minTlsVersion`                   | `string` | No       | Configures the minimum version of TLS required for SSL requests.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `linuxFxVersion`                  | `string` | No       | Linux App Framework and version. e.g. PYTHON|3.9                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `connectionStringProperties`      | `object` | No       | The connection strings properties                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |

## Outputs

| Name            | Type   | Description                                                               |
| :-------------- | :----: | :------------------------------------------------------------------------ |
| siteId          | string | Get resource id for app or functionapp.                                   |
| siteName        | string | Get resource name for app or functionapp.                                 |
| serverfarmsId   | string | Get resource ID of the app service plan.                                  |
| serverfarmsName | string | Get name of the app service plan.                                         |
| functions       | array  | Array of functions having name , language,isDisabled and id of functions. |
| sitePrincipalId | string | Principal Id of the identity assigned to the function app.                |

## Examples

### Example 1

```bicep
@description('''
In example, function app is using pre-built docker image,
deploy your code to Azure Functions as a custom Docker container using a image provided.
''')
module funcApp 'br/public:bicep/compute/function-app:1.1.2' = {
  name: 'func1${uniqueString(name)}'
  dependsOn: [
    dependencies
  ]
  params: {
    name: take(replace('fun1-${name}', '.', ''), 55)
    location: location
    sku: {
      name: 'Y1'
      tier: 'Dynamic'
      size: 'Y1'
      family: 'Y'
      capacity: 0
    }
    tags: tags
    storageAccountName: dependencies.outputs.saAccountName
    storgeAccountResourceGroup: resourceGroup().name
    enableSourceControl: false
    enableDockerContainer: true
    dockerImage: 'mcr.microsoft.com/azure-functions/dotnet:4-appservice-quickstart'
    serverOS: 'Linux'
  }
  scope: resourceGroup()
}

### Example 2
@description('''
In example, function app uses source control option for
Continuous deployment for Azure Functions ie. repoUrl param value.
''')
module funcApp 'br/public:bicep/compute/function-app:1.1.2' = {
  name: 'func2-${uniqueString(name)}'
  scope: resourceGroup()
  dependsOn: [
    dependencies
  ]
  params: {
    name: take(replace('fun2-${name}', '.', ''), 55)
    location: location
    sku: {
      name: 'EP1'
      tier: 'ElasticPremium'
      size: 'EP1'
      family: 'EP'
      capacity: 1
    }
    tags: tags
    maximumElasticWorkerCount: 20
    enableVnetIntegration: true
    enableInsights: true
    workspaceResourceId: dependencies.outputs.workspacesId
    subnetId: dependencies.outputs.subnetResourceIds
    functionsExtensionVersion: '~4'
    functionsWorkerRuntime: 'powershell'
    storageAccountName: dependencies.outputs.saAccountName
    storgeAccountResourceGroup: resourceGroup().name
    enableSourceControl: true
    repoUrl: 'https://github.com/Azure/KeyVault-Secrets-Rotation-Redis-PowerShell.git'
    enableDockerContainer: false
  }
}

```