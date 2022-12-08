

https://mermaid-js.github.io/mermaid/#/./sequenceDiagram

## Onboarding Process
```mermaid
sequenceDiagram
    autonumber
    actor Operator
    participant Config CRD
    participant Instance CRD
    participant Akri Controller
    participant Akri Agent 
    participant kubelet
    participant Custom Broker
    participant Leaf Device
    Operator->>Config CRD: Apply Configuration
    loop Detect New Configuration
        Config CRD->>Akri Agent: Detect New Configuration
    end
    loop Asset Onboarding
        Akri Agent->>Leaf Device: Discovery
    end
    Akri Agent->>Instance CRD: Create Instance
    Instance CRD-->>Akri Controller: Detect Instance Change
    Akri Controller->>Custom Broker:Schedule Broker Pod 
    kubelet->>Akri Agent: allocate
    Akri Agent->>Instance CRD: Update Instance with Reserved Slot
    kubelet->>Custom Broker: Run Pod
   
```
----

## OPC-UA Basic Flow
```mermaid
sequenceDiagram
    autonumber
    actor Operator
    participant Config CRD
    participant Instance CRD
    participant Akri Controller
    participant Akri Agent 
    participant kubelet
    participant Akri Secrets
    participant Akri OPC UA Broker
    participant OPC UA Server
    participant Azure ARM
    Operator->>Config CRD: Apply Configuration
    loop Detect New Configuration
        Config CRD->>Akri Agent: Detect New Configuration
    end
    loop Asset Onboarding
        Akri Agent->>OPC UA Server: Discovery
    end
    Akri Agent->>Instance CRD: Create Instance
    Instance CRD-->>Akri Controller: Detect Instance Change
    Akri Controller->>Akri OPC UA Broker:Schedule Broker Pod 
   
```
----

## Asset Management
```mermaid
sequenceDiagram
    autonumber
    actor Operator
    
    participant Instance CRD
    participant Akri Controller
    participant Akri Agent 
    participant kubelet
    participant Akri Secrets
    participant Akri OPC UA Broker
    participant OPC UA Server
    participant Azure ARM
    loop Asset Onboarding
        Akri Agent->>OPC UA Server: Discovery
    end
    Akri Agent->>Instance CRD: Create Instance
    Instance CRD-->>Akri Controller: Detect Instance Change
    Akri Controller->>Akri OPC UA Broker:Schedule Broker Pod 
   
```
----

## Assign Permissions for Node
```mermaid
sequenceDiagram
    autonumber
    actor Operator
    participant Config CRD
    participant Instance CRD
    participant Akri Controller
    participant Akri Agent 
    participant kubelet
    participant Akri Secrets
    participant Akri OPC UA Broker
    participant OPC UA Server
    participant Node
    Operator->>Config CRD: Apply Configuration
    loop Detect New Configuration
        Config CRD->>Akri Agent: Detect New Configuration
    end
    loop Node Feedback Loop
     OPC UA Server->>Node:    
    end
    Akri Agent->>Instance CRD: Create Instance
    Instance CRD-->>Akri Controller: Detect Instance Change
    Akri Controller->>Akri OPC UA Broker:Schedule Broker Pod 
   
```
----

## Monitoring A Subset of Nodes

```mermaid
sequenceDiagram
    autonumber
    actor Operator
    participant Monitoring Portal
    participant Asset Catalog
    participant Akri Broker
    participant Robot
    participant Factory Gateway
    loop Operation and Health Metrics
        Robot->>Akri Broker: Collection
    end
    loop Non Operational Robot
        Robot->>Factory Gateway: Telemetry Stream
        Operator->>Factory Gateway: Observe Data Stream
    end
```
----


## Send Commands To Specific Nodes

```mermaid
sequenceDiagram
    autonumber
    actor Operator
    participant Monitoring Portal
    participant Asset Catalog
    participant Akri Broker
    participant Robot
    participant Factory Gateway
    loop Operation and Health Metrics
        Robot->>Akri Broker: Collection
    end
    loop Non Operational Robot
        Robot->>Factory Gateway: Telemetry Stream
        Operator->>Factory Gateway: Observe Data Stream
    end
```

