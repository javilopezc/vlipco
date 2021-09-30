# vlipco
vlipco test
La aplicación web es una sencilla página html que ejecuta un javascript para mostrar la fecha
En el directorio Terraform, se encuentra el archivo main.tf. Este archivo de terraform realiza la creación de la instancia EC2, junto con los permisos necesarios para poder acceder a la misma por ssh y http
Dentro del directorio Ansible, se encuentran los archivos de configuracion para automatizar la instalacion del servicio apache dentro de la instancia, asi como el codigo html para visualizar la aplicacion. Hace uso de una llave ssh y del nombre publico de la instancia que se este ejecutando.
