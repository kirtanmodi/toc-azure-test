const { app } = require('@azure/functions');

app.serviceBusQueue('serviceBusQueueTrigger1', {
    connection: 'undefined',
    queueName: 'myinputqueue',
    handler: (message, context) => {
        context.log('Service bus queue function processed message:', message);
    }
});
