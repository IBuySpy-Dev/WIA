// WIA S4 — App Service (no SQL, pre-compiled .NET 4.5 WebForms, Issue #624)
param location string = resourceGroup().location

var suffix = uniqueString(resourceGroup().id)
var planName = 'plan-wia-dev-${suffix}'
var appName = 'app-wia-dev-${suffix}'

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: planName
  location: location
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
  properties: {
    reserved: false
  }
}

resource appService 'Microsoft.Web/sites@2022-03-01' = {
  name: appName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      netFrameworkVersion: 'v4.0'
      use32BitWorkerProcess: false
      ftpsState: 'Disabled'
      httpLoggingEnabled: true
      detailedErrorLoggingEnabled: true
    }
    httpsOnly: true
  }
}

output appServiceUrl string = 'https://${appService.properties.defaultHostName}'
output appServiceName string = appService.name