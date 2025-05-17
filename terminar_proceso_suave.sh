#!/bin/bash

ejecutar_terminar_proceso_suave() {
    read -p "Ingrese el PID del proceso que desea terminar: " pid
    if [[ -n "$pid" && "$pid" -eq "$pid" ]] ; then
        echo "Está seguro de que desea enviar la señal SIGTERM (terminación suave) al proceso con PID $pid? (s/n)"
        read -r confirmacion
        if [[ "$confirmacion" == "s" || "$confirmacion" == "S" ]]; then
            kill "$pid" # SIGTERM es la señal por defecto si no se especifica
            if [ $? -eq 0 ]; then
                echo "Señal SIGTERM enviada al proceso $pid."
            else
                echo "Error al enviar la señal al proceso $pid."
            fi
        else
            echo "Operación de terminación cancelada."
        fi
        echo ""
    else
        echo "PID inválido."
        echo ""
    fi
}

# Llamada a la función principal si el script se ejecuta directamente
ejecutar_terminar_proceso_suave "$@"

# Explicación de la función ejecutar_terminar_proceso_suave()
#
# Esta función permite terminar un proceso en ejecución enviando una señal de
# terminación suave (SIGTERM). Le solicita al usuario que ingrese el PID del proceso
# que desea finalizar y luego pide confirmación antes de enviar la señal.
# El comando 'kill <PID>' se utiliza para enviar la señal SIGTERM. Esta señal
# da al proceso la oportunidad de cerrarse de forma ordenada, guardando su estado
# si es necesario. Si la señal se envía correctamente, se mostrará un mensaje
# de confirmación; de lo contrario, se indicará un error.
