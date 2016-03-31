El comando goto te permite definir palabras clave y asociarlas a rutas en tu sistema. Ejecutar el comando "goto OBJ" siendo OBJ una palabra clave asociada hara que la terminal desde donde has ejecutado se abra en esa carpeta. Para mas información, ejecuta "goto -h".

Para instalar, primero descomprime los ficheros, y ejecuta los siguientes comandos desde la carpeta donde los hayas descomprimido:
	chmod +x INSTALL.sh
	./INSTALL.sh
Usa -d [/ruta/absoluta/deseada] para cambiar la carpeta de destino. Para usar el comando ejecuta "source ~/.bash.rc" o abre una nueva terminal.

 = ACTUALIZAR DESDE UNA VERSION ANTERIOR = 
 
Si al instalar la nueva version elegiste conservar el ficherod e configuracion y ahora algunos tags no funcionan abre el fichero de configuracion (por defecto ~/.scripts/gotoDIRS) y añade el caracter ':' tras cada tag que no lo tenga.
Ejemplo:
	Cambia esto:
		UNI /home/rellik/Universidad
	Por esto:
		UNI: /home/rellik/Universidad
		
		
Si tienes cualquier problema puedes contactar conmigo en mcc47@alu.ua.es


	= ACTUALIZAR DESDE LA 1.1 =

Lo unico que ha cambiado desde la version anterior es el autocompletado, por lo que podeis machacar el archivo /etc/bash_completion.d/goto por gotoAuto, que esta en esta misma carpeta
 
