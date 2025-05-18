#!/bin/bash

# Definición de colores
RED="\e[31m"
GREEN="\e[32m"
NC="\e[0m" # Sin color

# Creo la función
forzar_proceso() {
  echo -n "Ingresa el ID del proceso a forzar: "
  read pid

  # Condición para verificar que no esté vacía la variable 
  if [ -z "$pid" ]; then
    echo -e "${RED}No ingresaste ningún PID.${NC}"
    return
  fi

  # Validación para saber si es un número
  if ! [[ "$pid" =~ ^[0-9]+$ ]]; then
    echo -e "${RED}El PID ingresado no es un número válido.${NC}"
    return
  fi

  # Validación o verificación del proceso
  if ps -p "$pid" > /dev/null; then
    kill -9 "$pid"
    echo -e "${GREEN}Proceso $pid finalizado con SIGKILL (kill -9).${NC}"
  else
    echo -e "${RED}El proceso con PID $pid no existe.${NC}"
  fi

  echo ""
  read -p "Presiona cualquier tecla para volver al menú anterior..."
}

# Llamo a la funcion ,se me olvido antes
 forzar_proceso



