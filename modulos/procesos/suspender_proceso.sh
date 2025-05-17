#!/bin/bash

suspender_proceso() {
  echo "Ingrese el PID del proceso a suspender:"
  read PID

  if [ -z "$PID" ]; then
    echo "No se ingresó un PID."
    return
  fi

  # Mostramos el proceso(aca valido q exista  )
  ps -p "$PID"
  if [ $? -eq 0 ]; then
    kill -19 "$PID"
    echo "Proceso $PID suspendido con SIGSTOP (kill -19)."
  else
    echo "El proceso con PID $PID no existe."
  fi
}

