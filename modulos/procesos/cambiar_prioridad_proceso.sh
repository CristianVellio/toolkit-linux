#!/bin/bash

# Función para cambiar prioridad de un proceso

cambiar_prioridad(){
	echo "ingrese el PID del proceso:"
	read pid

	echo "ingrese la nueva prioridad (entre -20 y 19):"
	read prioridad

	# Usamos el comadno renicie
	renice "$prioridad" -p "$pid"
	read -p "Presione ENTER para continuar.."
}

#Llamado a la funcion

cambiar_prioridad

