#!/bin/bash

# Colores opcionales
CYAN='\033[1;36m'
NC='\033[0m' # Sin color

ejecutar() {
  while true; do
    clear
    echo -e "${CYAN}=============================="
    echo -e " Procesos en ejecución (ps aux)"
    echo -e "==============================${NC}"
    echo
    ps aux

    echo
    echo "¿Qué desea hacer ahora?"
    echo "1) Volver al menú de procesos"
    echo "2) Salir"
    echo -n "Ingrese su opción [1-2]: "
    read opcion

    case $opcion in
      1) break ;; 
      2) exit 0 ;;
      *) echo "Opción inválida. Presione Enter para intentar nuevamente..." ; read ;;
    esac
  done
}

ejecutar