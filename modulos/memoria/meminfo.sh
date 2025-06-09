#!/bin/bash

# meminfo.sh - Mostrar información detallada del sistema de memoria desde /proc/meminfo

# Función para mostrar encabezado
mostrar_encabezado() {
    clear # Limpia la pantalla
    echo "==========================================="
    echo "  Información Detallada de /proc/meminfo  "
    echo "==========================================="
    echo ""
}

# Función para verificar la existencia del archivo /proc/meminfo
verificar_meminfo_archivo() {
    if [ ! -f "/proc/meminfo" ]; then
        mostrar_encabezado # Limpiar pantalla antes del error
        echo "Error: El archivo /proc/meminfo no se encontró."
        echo "Este archivo es esencial para obtener estadísticas detalladas de memoria."
        echo ""
        echo "Presiona Enter para salir..."
        read -r
        exit 1 # Sale con un código de error
    fi
}

# Llama a la función de verificación al inicio
verificar_meminfo_archivo

# Muestra el encabezado
mostrar_encabezado

# Muestra el contenido completo del archivo /proc/meminfo
echo "A continuación, se muestra el contenido completo de /proc/meminfo:"
echo "--------------------------------------------------------"
cat /proc/meminfo

echo ""
echo "--------------------------------------------------------"
echo ""
echo "Presiona Enter para volver al menú de Memoria..."
read -r

exit 0 # Salida exitosa del script


# Explicación de la funcionalidad del script 'meminfo.sh':
# Este script muestra información detallada de la memoria virtual del sistema,
# obtenida directamente del archivo '/proc/meminfo'.

# Su funcionamiento es el siguiente:
# 1. Verifica la existencia de '/proc/meminfo'. Si no lo encuentra, muestra un error y sale.
# 2. Si el archivo existe, limpia la pantalla y muestra todo su contenido,
#    proporcionando datos exhaustivos sobre RAM y SWAP.
# 3. Pausa la ejecución al finalizar, permitiendo al usuario revisar la información
#    antes de regresar al menú principal.
