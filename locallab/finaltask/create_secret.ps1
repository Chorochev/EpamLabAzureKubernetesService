kubectl create secret docker-registry regcred `
        --docker-server=chorochev `
        --docker-username=chorochev `
        --docker-password="*****" `
        --docker-email="alex@mail.ru"

kubectl get secret

kubectl get secret regcred --output=yaml | Out-File -FilePath dockerconfigjson

# Check
# kubectl get secret regcred --output="jsonpath={.data.\.dockerconfigjson}" | base64 --decode