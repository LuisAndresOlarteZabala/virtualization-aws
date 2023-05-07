# -*- mode: ruby -*-
# vi: set ft=ruby :

# Toda la configuración de Vagrant se realiza a continuación. 
# El "2" en Vagrant.configure
# configura la versión de configuración (soportamos estilos más antiguos para compatibilidad al revés). 
# Por favor, no lo cambies a menos que sepas qué estás haciendo.
Vagrant.configure("2") do |config|
  # Cada entorno de desarrollo de Vagrant requiere una caja. Puedes buscar
  # cajas en https://vagrantcloud.com/search.
  config.vm.box = "generic/ubuntu2204"

  # Deshabilite la verificación automática de actualizaciones de casillas. Si deshabilitas esto, entonces
  # Solo se marcarán # casillas en busca de actualizaciones cuando el usuario ejecute `caja vagrant desactualizada`. Esto no es recomendable.
  config.vm.box_check_update = false

  # Cree una asignación de puertos reenviados que permita el acceso a un puerto específico dentro de la máquina desde un puerto en la máquina host. 
  # En el siguiente ejemplo, al acceder a "localhost:8080" accederá al puerto 80 en la máquina invitada.
  # NOTA: Esto habilitará el acceso público al puerto abierto
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Cree una red privada, que permita el acceso de solo host a la máquina usando una IP específica.
  config.vm.network "private_network", ip: "192.168.11.10"

  # Comparta una carpeta adicional con la máquina virtual invitada. El primer argumento es
  # la ruta en el host a la carpeta real. El segundo argumento es
  # la ruta en el invitado para montar la carpeta. 
  # el tercer argumento es opcional argumento es un conjunto de opciones no requeridas.
  config.vm.synced_folder "../data", "/vagrant_data"

  # Configuración específica del proveedor para que pueda ajustar varios proveedores de respaldo para Vagrant. Estos exponen opciones específicas del proveedor.
  # Ejemplo para VirtualBox:
  config.vm.provider "virtualbox" do |vb|
    # Mostrar la GUI de VirtualBox al arrancar la máquina
    vb.gui = true
    # Personaliza la cantidad de memoria en la VM:
    vb.memory = "1024"
    # Personaliza la cantidad de CPUs en la VM:
    vb.cpus = 1
  end

  # Vea la documentación del proveedor que está utilizando para obtener más información sobre las opciones disponibles.
  config.vm.provision "shell", path: "provision_wordpres.sh"
end
