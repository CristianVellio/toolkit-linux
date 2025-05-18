#!/bin/bash

# Colores
RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"
NC="\e[0m" # No Color

while true; do
  clear
  echo -e "${CYAN}==================================================${NC}"
  echo -e "${CYAN}  Toolkit de Administración Jr. - Servidores ISPC ${NC}"
  echo -e "${CYAN}==================================================${NC}\n"
  echo -e "¡Hola! Bienvenido al Toolkit de Administración:${NC}\n"
  echo "1) Gestión de Procesos"
  echo "2) Información de Memoria"
  echo "3) Información de Disco y Archivos"
  echo "4) Administración de Usuarios y Grupos"
  echo "5) Chequeos de Seguridad Básica"
  echo "6) Salir"
  echo "----------------------------------------------"
  read -rp "Ingresa el número de tu opción: " opcion

  case $opcion in
    1)
      bash ./modulos/procesos/procesos.sh
      ;;
    2)
      bash ./modulos/memoria/memoria.sh
      ;;
    3)
      bash ./modulos/disco/disco.sh
      ;;
    4)
      bash ./modulos/usuarios/usuarios.sh
      ;;
    5)
      bash ./modulos/seguridad/seguridad.sh
      ;;
    6)
      echo -e "${GREEN}Gracias por usar el Toolkit. ¡Hasta luego!${NC}"
      exit 0
      ;;
    *)
      echo -e "${RED}Opción inválida. Intenta nuevamente.${NC}"
      sleep 2
      ;;
  esac
done