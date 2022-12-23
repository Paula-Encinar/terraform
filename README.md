# Terraform
## Terraform interesing command
- ```terrafom init``` Para inicializar el directorio, en principio es necesario solo una vez para que descargue el provider etc 

- ``terraform fmt`` Te imprime los archivos en caso de que este modificados y reescribe los ficheros de configs imponiendo un formato y estilo adecuados. 

- ``terraform validate``realiza un validación sintactica. 

- ``terraform plan -out tfplan``crea un plan de ejecución, el cual permite una revisión previa de los cambios que se haran en la infra.

- ``terraform apply tfplan`` aplica los cambios  en la infra 

- ``terraform show``se utiliza una vez desplegado en la infra para ver el estado

- ``terraform state list``lista cada uno de los recursos  del estado definido del proyecto desplegados 

- ``terraform destroy``destruye la infra que se ha creado


## Desplegar en AWS

Hay que tener obviamente una cuenta de AWS y credenciales asociadas. hay dos formas de hacer el sing-in en la consola, con user root (No recomendado) o con IAM user (mi caso) para ello tiene que configurar las siguientes variables de entorno.

``export AWS_ACCESS_KEY_ID=``
``export AWS_SECRET_ACCESS_KEY=``


Importante, cuando despliegas buscar en el user adecuado y en la región adecuada para ver lo que ha instanciado. 


