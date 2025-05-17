#!/bin/bash

# Colores opcionales
CYAN='\033[1;36m'
NC='\033[0m' # Sin color

ejecutar() {
  clear
  echo -e "${CYAN}=============================="
  echo -e " Procesos en ejecución (ps aux)"
  echo -e "==============================${NC}\n"
  ps aux
  echo -e "\nPresiona Enter para volver al menú..."
  read
}

ejecutar