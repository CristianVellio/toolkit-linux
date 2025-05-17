#!/bin/bash

# Colores opcionales
RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"
NC="\e[0m" # Sin color

while true; do
  clear
  echo -e "${CYAN}===================================================${NC}"
  echo -e "${CYAN}Toolkit de Administración Jr. - Gestión de Procesos${NC}"
  echo -e "${CYAN}===================================================${NC}"
  echo "1) Mostrar todos los procesos"
  echo "2) Ver detalles de un proceso por PID"
  echo "3) Terminar un proceso (SIGTERM)"
  echo "4) Terminar un proceso (SIGKILL)"
  echo "5) Suspender un proceso (SIGSTOP)"
  echo "6) Reanudar un proceso (SIGCONT)"
  echo "7) Cambiar prioridad de un proceso"
  echo "8) Abrir monitor de procesos (top)"
  echo "9) Volver al menú principal"
  echo "----------------------------------------------"

  read -rp "Ingresa el número de tu opción: " opcion

  case $opcion in
    1) bash ./listar_procesos_todos.sh ;;
    2) bash ./ver_detalles_proceso.sh ;;
    3) bash ./terminar_proceso_suave.sh ;;
    4) bash ./terminar_proceso_forzado.sh ;;
    5) bash ./suspender_proceso.sh ;;
    6) bash ./reanudar_proceso.sh ;;
    7) bash ./cambiar_prioridad_proceso.sh ;;
    8) bash ./abrir_monitor_procesos.sh ;;
    9) bash ./main_toolkit.sh ;;
    *) echo -e "${RED}Opción inválida. Intenta nuevamente.${NC}"; sleep 2 ;;
  esac
done