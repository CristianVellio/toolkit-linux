#!/bin/bash
# cambiar_prioridad_procesos.sh
# Script para cambiar la prioridad (nice) de un proceso dado su PID.
# Uso:
#   1. Dar permisos de ejecución: chmod +x cambiar_prioridad.sh
#   2. Ejecutar con sudo: sudo ./cambiar_prioridad.sh

# Función para cambiar la prioridad de un proceso
cambiar_prioridad(){
    # Verificar si se ejecuta como root
    if [ "$EUID" -ne 0 ]; then
        echo "⚠️ Este script debe ejecutarse como root (use sudo)."
	echo "Dar permisos de ejecución: chmod +x cambiar_prioridad_proceso.sh"
        read -p "Presione ENTER para salir..."
        exit 1
    fi

    echo "Ingrese el PID del proceso:"
    read pid

    # Validar que el PID sea un número
    if ! [[ "$pid" =~ ^[0-9]+$ ]]; then
        echo "❌ PID inválido. Debe ser un número."
        read -p "Presione ENTER para salir..."
        exit 1
    fi

    # Verificar si el proceso existe
    if ! ps -p "$pid" > /dev/null; then
        echo "❌ No existe ningún proceso con PID $pid."
        read -p "Presione ENTER para salir..."
        exit 1
    fi

    echo "Ingrese la nueva prioridad (entre -20 y 19):"
    read prioridad

    # Validar que la prioridad sea un número válido
    if ! [[ "$prioridad" =~ ^-?[0-9]+$ ]] || [ "$prioridad" -lt -20 ] || [ "$prioridad" -gt 19 ]; then
        echo "❌ Prioridad inválida. Debe ser un número entre -20 y 19."
        read -p "Presione ENTER para salir..."
        exit 1
    fi

    # Intentar cambiar la prioridad
    if renice "$prioridad" -p "$pid"; then
        echo "✅ Prioridad cambiada correctamente."
    else
        echo "❌ Error al cambiar la prioridad. Asegúrese de tener permisos suficientes."
    fi

    read -p "Presione ENTER para continuar..."
}

# Llamado a la función
cambiar_prioridad
