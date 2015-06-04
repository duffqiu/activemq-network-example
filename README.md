### activemq network broker example deployment



- this simple project is used to simulate the activemq hub topology to support scale-out/scale-in
- the overview idea is there is no need to reconfigure or restart brokers in hub and other running edge brokers when adding more edge broker to support more capacity of the activemq network
- each block in the diagram (named Corex-x and Edgex-x-x) is an activemq master/slave cluster (but not configured in this example, to use leveldb is better but maybe need to consider how to setup zookeeper with it)
- there is some limitation about "replay" in network broker for queue (also for virtual queue), i have raised an issue for it [issue](https://issues.apache.org/jira/browse/AMQ-5827) 
- if need, the consumer/producer can setup the failover uri to another broker in another availabe zoon (the dot line)
 

### Some tips:

- if there is no subscriber, the topic message will be drop
- even if the subscriber for the topic has left(no active subscriber), the durable message will be stored
- queue message will be stored if it is durable what ever there is consumer or not
- for virtual topic, if using virtual queue to recieve the message, sometimes the consumer can't get the message before restart (consumer has started before the producer). not sure it is the client app issue or activemq issue. (I use the example app called "swissarmy" in the activemq example folder)
