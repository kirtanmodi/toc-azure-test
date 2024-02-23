param appPrefix string

@description('Name of the Service Bus namespace')
param serviceBusNamespaceName string = '${appPrefix}-servicebus-namespace'

@description('Name of the Queue')
param serviceBusQueueName string = '${appPrefix}-servicebus-queue'

@description('Location for all resources.')
param location string

resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2022-01-01-preview' = {
  name: serviceBusNamespaceName
  location: location
  sku: {
    name: 'Basic'
    tier: 'Basic'
    capacity: 1
  }
  properties: {}
}

resource serviceBusQueue 'Microsoft.ServiceBus/namespaces/queues@2022-01-01-preview' = {
  parent: serviceBusNamespace
  name: serviceBusQueueName
  properties: {
    // requiresDuplicateDetection: true
    // requiresSession: true
    deadLetteringOnMessageExpiration: false
    duplicateDetectionHistoryTimeWindow: 'PT10M'
    maxDeliveryCount: 10
  }
}
