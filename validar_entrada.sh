#!/bin/bash

# Validar si un valor es un número entero positivo
es_entero_positivo() {
    [[ "$1" =~ ^[0-9]+$ ]] && return 0 || return 1
}

# Validar si el PID existe
pid_existe() {
    es_entero_positivo "$1" && kill -0 "$1" 2>/dev/null
}


# Para poner a funcionar este validador tenemos que
# llamarlo de la siguiente manera (sin utilizar el hashtag) :

#source ./validar_entrada.sh

#read -p "Ingrese un PID: " pid
#if pid_existe "$pid"; then
#    echo "PID válido."
#else
#    echo "PID inválido o no existe."
#fi
