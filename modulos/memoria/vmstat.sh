#!/bin/bash

# vmstat.sh - Mostrar estadísticas de procesos y memoria usando vmstat

# Función para mostrar encabezado
mostrar_encabezado() {
    echo "========================================"
    echo "    Estadísticas de Memoria y Procesos"
    echo "========================================"
}

# Función para mostrar el menú
mostrar_menu() {
    echo ""
    echo "Seleccione una opción:"
    echo "1) Ver resumen del sistema (vmstat -s)"
    echo "2) Ver actividad en tiempo real (vmstat 1 5)"
    echo "3) Ver estadísticas de disco (vmstat -d)"
    echo "4) Ver paginación del disco sda (vmstat -p sda)"
    echo "5) Ver memoria activa/inactiva (vmstat -a)"
    echo "6) Ver número de procesos desde el arranque (vmstat -f)"
    echo "7) Volver"
    echo ""
    read -p "Opción: " opcion
}

# Función para validar que vmstat esté instalado
verificar_comando() {
    if ! command -v vmstat &> /dev/null; then
        echo "Error: vmstat no está instalado. Intenta instalarlo con: sudo apt install procps"
        exit 1
    fi
}

# Verificar que vmstat esté disponible
verificar_comando

# Mostrar título
mostrar_encabezado

# Bucle del menú
while true; do
    mostrar_menu

    case "$opcion" in

        1)
            echo ""
            echo "Mostrando resumen del sistema..."
            vmstat -s

            echo ""
            echo "Analizando uso de swap..."

            # Intentar detectar nombre de las líneas en inglés y español
            total_swap=$(vmstat -s | grep -Ei "total swap|intercambio total" | awk '{print $1}')
            used_swap=$(vmstat -s | grep -Ei "used swap|intercambio usado" | awk '{print $1}')

            if [[ -z "$total_swap" || -z "$used_swap" ]]; then
                echo "❌ No se pudo determinar el uso de swap (datos faltantes o formato desconocido)."
            elif [[ "$total_swap" -eq 0 ]]; then
                echo "ℹ️ El sistema no tiene swap configurada o está desactivada."
            elif [[ "$used_swap" -eq 0 ]]; then
                echo "✅ Swap disponible pero no está en uso actualmente."
            else
                porcentaje=$(echo "scale=2; $used_swap * 100 / $total_swap" | bc)
                echo "Swap utilizada: $used_swap KB de $total_swap KB ($porcentaje%)"

                if (( $(echo "$porcentaje > 20" | bc -l) )); then
                    echo "⚠️  Advertencia: Estás usando más del 20% de la swap. Podría haber presión de memoria."
                else
                    echo "✅ Uso de swap en niveles normales."
                fi
            fi
            ;;
        2)
            echo ""
            echo "Mostrando actividad del sistema en tiempo real (5 muestras)..."
            vmstat 1 5
            ;;
        3)
            echo ""
            echo "Mostrando estadísticas de disco..."
            vmstat -d
            ;;
        4)
            echo ""
            echo "Mostrando estadísticas de paginación para el disco sda..."
            vmstat -p sda
            ;;
        5)
            echo ""
            echo "Mostrando memoria activa/inactiva..."
            vmstat -a
            ;;
        6)
            echo ""
            echo "Mostrando número de procesos creados desde el arranque..."
            vmstat -f
            ;;
        7)
            echo "Volver a Menú de memoria"
            break ;;
        *)
            echo "❌ Opción inválida. Por favor elige entre 1 y 7."
            ;;
    esac

    echo ""
    read -p "Presiona Enter para continuar..." dummy
    clear
    mostrar_encabezado
done
