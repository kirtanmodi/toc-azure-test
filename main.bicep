param location string = resourceGroup().location
param appPrefix string = 'toc'

module servicebus 'bicep-modules/serviceBus.bicep' = {
  name: 'servicebus'
  params: {
    appPrefix: appPrefix
    location: location
  }
}

module functionApp 'bicep-modules/functionApp.bicep' = {
  name: 'functionApp'
  params: {
    appPrefix: appPrefix
    location: location
    appInsightsLocation: location
  }
}
