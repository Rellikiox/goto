#!/bin/bash

	#VARIABLES

default_path=$HOME/.scripts
scrip_path=""
script="goto"
conf="gotoDIRS"
install_log="instal.log"


	#MESSAGES

bashrc_1="\nif [ -f " 
bashrc_2=" ]; then\n\t"
bashrc_3="\nfi\n"

msg_succes="La instalación ha sido completada. Para terminar la instalación abre un nuevo terminal o ejecuta \"source ~/.bashrc\". Para obtener ayuda de uso utiliza el comando \"goto -h\"."

msg_failure="El instalador ha encontrado un problema. Usa ./INSTALL --help para ver la ayuda."

msg_path_notfound="La ruta indicada no existe ¿Desea crearla? (y/n)"

msg_wrong_parameters="Parametros incorrectos."

msg_help="Utiliza ./INSTALL.sh para usar la configuracion por defecto (el script se instalara en $HOME/.scripts/). \nPara instalarlo en otra ruta utiliza ./INSTALL.sh -d [/ruta/deseada/desde/root]."

msg_update="Se ha encontrado una version anterior del fichero de configuracion (tags de versiones anteriores pueden no ser compatibles con la ultima version del software) ¿Desea conservarlo? (y/n)"

msg_autocomplete="¿Deseas instalar el autocompletado? (y/n)"

	#MAIN

if [ $# -ge 3 ]; then
	echo -e $msg_wrong_parameters
	echo -e $msg_help
else
	if [ $# = 2 ]; then
		if [ $1 = "-d" ]; then
			if [ -d $2 ]; then
				script_path=$2
			else
				echo -n $msg_path_notfound ""
				read answer
				if [ $answer = "y" ]; then
					mkdir -p $2
					script_path=$2
				else
					exit 0
				fi
			fi
		else
			echo -e $msg_failure
		fi
	elif [ $# = 1 ]; then
		if [ $1 = "--help" ]; then
			echo -e $msg_help
		else
			echo -e $msg_failure
		fi
	else
		script_path=$default_path
	fi
	#Install
	
	if [ ! -d $script_path ]; then
		mkdir -p $script_path 
	fi

	cp -f goto $script_path/goto
	
	if [ -f $script_path/gotoDIRS ]; then
		echo $msg_update
		read answer
		if [ $answer = "n" ]; then
			rm -f $script_path/gotoDIRS
			touch $script_path/gotoDIRS
		fi
	else
		touch $script_path/gotoDIRS
		echo -e -n "\nif [ -f $script_path/goto ]; then\n\t. $script_path/goto\nfi\n"  >>$HOME/.bashrc
	fi	

	echo $msg_autocomplete
	read answer
	if [ $answer = "y" ]; then
		cp gotoAuto /etc/bash_completion.d/goto
	fi

	echo $msg_succes

fi
