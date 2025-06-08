#!/bin/bash

ejecutar() {
    read -p "Ingrese el PID del proceso que desea reanudar: " pid
    if [[ -n "$pid" && "$pid" -eq "$pid" ]]; then
        echo "¿Está seguro de que desea enviar la señal SIGCONT (reanudar) al proceso con PID $pid? (s/n)"
        read -r confirmacion
        if [[ "$confirmacion" == "s" || "$confirmacion" == "S" ]]; then
            kill -18 "$pid"
            if [ $? -eq 0 ]; then
                echo "Señal SIGCONT enviada al proceso $pid."
                read -p "Presione ENTER para continuar.."
            else
                echo "Error al enviar la señal al proceso $pid."
            fi
        else
            echo "Operación de reanudación cancelada."
        fi
        echo ""
    else
        echo "PID inválido."
        echo ""
    fi
}

# Llamada a la función principal si el script se ejecuta directamente
ejecutar "$@"

## Explicación de la función ejecutar()
# Esta función permite reanudar un proceso que ha sido pausado o suspendido.
# Solicita al usuario que ingrese el PID (identificador del proceso)
# y pide confirmación antes de enviar la señal SIGCONT (código 18).
# La señal SIGCONT reanuda la ejecución de procesos detenidos mediante SIGSTOP o Ctrl+Z.
# Si la señal se envía correctamente, se muestra un mensaje confirmando la acción;
# de lo contrario, se informa de un error.
