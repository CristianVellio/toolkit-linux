#!/bin/bash

mostrar_memoria_virtual () {
    echo "--- Información Detallada de Memoria Virtual ---"

    # 1. Se verifica que el comando 'head' está disponible en el sistema.
    if ! command -v head &> /dev/null; then
        echo "Error: El comando 'head' no se encontró. Es necesario para leer el archivo de memoria."
        return 1 # Devuelve un código de error.
    fi

    # 2. Se verifica la existencia del archivo /proc/meminfo.
    if [ ! -f "/proc/meminfo" ]; then
        echo "Error: El archivo /proc/meminfo no se encontró."
        echo "Este archivo es necesario para obtener estadísticas de memoria."
        return 1 # Devuelve un código de error.
    fi

    # 3. Se muestra la información de memoria virtual.
    echo "Aquí se muestran las primeras líneas, incluyendo Swap (memoria virtual):"
    head /proc/meminfo | grep -E 'Mem|Buffer|Cached|Swap'

    echo "------------------------------------------------"
    return 0 # Devuelve 0 para indicar que la función se ejecutó con éxito.
}

