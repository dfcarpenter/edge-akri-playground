## Scenario setup.

### Requirements
- Azure Subscription

### Steps 
- Run setup.sh or setup.ps1
- Setup Azure Cloud resources
    - Eventhub 
- Install E4K
```powershell
helm install e4k oci://e4kpreview.azurecr.io/helm/az-e4k `
--version 0.1.0-amd64 `
-f .\e4k-values.yaml
```
- Install Apollo 
    - clone Apollo repo locally and switch to e4k-bridge branch
    - ensure values.apollo.e4k.yaml contain the below values

## 3. Install Akri
```sh
helm repo add akri-helm-charts https://project-akri.github.io/akri/
```
