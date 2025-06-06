#!/bin/bash

suspender_proceso() {
  echo -e "${CYAN}Ingrese el PID del proceso a suspender:${NC}"
  read pid

  # Valido si no se ingresó nada
  if [ -z "$pid" ]; then
    echo -e "${RED}No se ingresó ningún PID.${NC}"
    echo ""
    read -p "Presiona Enter para volver al menú anterior..."
    return
  fi

  # Valido que sea un número entero
  if ! [[ "$pid" =~ ^[0-9]+$ ]]; then
    echo -e "${RED}El PID ingresado no es un número válido.${NC}"
    echo ""
    read -p "Presiona Enter para volver al menú anterior..."
    return
  fi

  # Valido  si el proceso existe
  if ps -p "$pid" > /dev/null; then
    kill -19 "$pid"
    echo -e "${GREEN}Proceso $pid suspendido correctamente con SIGSTOP (kill -19).${NC}"
  else
    echo -e "${RED}El proceso con PID $pid no existe.${NC}"
  fi

  echo ""
  read -p "Presiona Enter para volver al menú anterior..."
}


 suspender_proceso "$@"
 


