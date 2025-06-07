#!/bin/bash

# Colores opcionales
RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"
NC="\e[0m" # Sin color

while true; do
  clear
  echo -e "${CYAN}======================================================${NC}"
  echo -e "${CYAN}Toolkit de Administración Jr. - Información de Memoria${NC}"
  echo -e "${CYAN}======================================================${NC}"
  echo "1) Ver uso de RAM y SWAP"
  echo "2) Ver contenido de /proc/meminfo (resumen)"
  echo "3) Ver información de procesos y memoria (vmstat)"
  echo "4) Volver al menú principal"
  echo "----------------------------------------------"

  read -rp "Ingresa el número de tu opción: " opcion

  case $opcion in
    1) ./modulos/memoria/UsoRam.sh ;;
    2) ./modulos/memoria/???.sh ;;
    3) ./modulos/memoria/???.sh ;;
    4) break ;;
    *) echo -e "${RED}Opción inválida. Intenta nuevamente.${NC}"; sleep 2 ;;
  esac
done
