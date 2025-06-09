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



# Se llama a la función para que se ejecute
mostrar_memoria_virtual 
read -p "Presione ENTER para volver al menú."

#Explicación de la función mostrar_memoria_virtual():
#La funcionalidad muestra un breve informe del uso de memoria, el cual ejecuta las siguientes instancias:

# -El script se asegura de contar con el archivo donde se guardan los detalles de la memoria. Si no es encontrado, se mostrara un mensaje de error.
#2- Si el archivo es encontrado se realiza una búsqueda y filtrado donde se muestran solo las líneas más importantes. #Principalmente cuánta RAM (memoria rápida) y cuánta memoria virtual (Swap) está se esta utilizando en el sistema.
#3- Se muestran en pantalla los resultados del estado de la memoria.

