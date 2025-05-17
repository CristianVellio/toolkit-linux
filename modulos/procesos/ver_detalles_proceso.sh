#!/bin/bash

ejecutar_ver_detalles_proceso() {
    read -p "Ingrese el PID del proceso a ver en detalle: " pid
    if [[ -n "$pid" && "$pid" -eq "$pid" ]] ; then
        echo "======================================="
        echo " Detalles del Proceso (PID: $pid)"
        echo "======================================="
        ps -p "$pid" -o pid,user,pcpu,pmem,vsz,rss,tty,stat,start,time,command
        if [ $? -ne 0 ]; then
            echo "No se encontró ningún proceso con el PID $pid."
        fi
        echo ""
    else
        echo "PID inválido."
        echo ""
    fi
}

# Llamada a la función principal si el script se ejecuta directamente
ejecutar_ver_detalles_proceso "$@"

## Explicación de la función ver_detalles_proceso()
#Esta función le solicita al usuario que ingrese el PID (Número de Identificación del Proceso)
# del cual desea ver información detallada. Utiliza el comando 'ps -p <PID> -o ...'
# para mostrar información como el usuario, el uso de CPU y memoria, el estado,
# el tiempo de inicio y el comando del proceso especificado. Si el PID ingresado
# no es válido o no corresponde a ningún proceso en ejecución, se mostrará un mensaje
# indicando que el el número de proceso no es válido.

