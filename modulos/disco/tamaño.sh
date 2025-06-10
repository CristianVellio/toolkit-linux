#!/bin/bash

calcular_tamaño() {
    read -p "Ingrese la ruta del archivo o directorio: " ruta
    if [[ -e "$ruta" ]]; then
        echo "¿Desea calcular el tamaño total de '$ruta'? (s/n)"
        read -r confirmacion
        if [[ "$confirmacion" == "s" || "$confirmacion" == "S" ]]; then
            echo "========================================"
            echo " Tamaño total de: $ruta"
            echo "========================================"
            du -sh "$ruta"
        else
            echo "Operación cancelada."
        fi
        echo ""
    else
        echo "La ruta especificada no existe."
        echo ""
    fi
}

# Llamada a la función principal si el script se ejecuta directamente
calcular_tamaño "$@"

## Explicación de la función calcular_tamaño()
# Esta función permite al usuario calcular el tamaño total de un archivo
# o directorio específico. Utiliza el comando 'du -sh <ruta>', donde:
# -s muestra solo el total, sin desglosar subdirectorios
# -h presenta el resultado en un formato legible (KB, MB, GB, etc.)
# Primero verifica si la ruta ingresada existe, luego solicita confirmación,
# y finalmente muestra el tamaño total si se confirma la operación.
