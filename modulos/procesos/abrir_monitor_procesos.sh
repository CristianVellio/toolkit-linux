#!/bin/bash

while true; do
    clear
    echo "===== TOOLKIT DE ADMINISTRACIÓN JR ====="
    echo "1) Monitorear procesos (top/htop)"
    echo "2) Salir"
    echo "========================================"
    read -p "Seleccione una opción: " opcion

    case $opcion in
        1)
            if command -v htop >/dev/null 2>&1; then
                echo "Abriendo htop..."
                htop
            else
                echo "htop no está instalado. Abriendo top..."
                top
            fi
            read -p "Presione Enter para volver al menú..."
            ;;
        2)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción inválida. Intente de nuevo."
            sleep 2
            ;;
    esac
done
