#!/bin/bash
funcion_forzar_proceso(){
echo  -n "ingresa el id del proceso a forzar ejecucion"
read pid

if ["$pid"]; then
  kill -9 "$pid" && echo "proceso $pid terminado "

else
    echo "no ingresaste ningun id de proceso.Terminando ejecucion ..."

fi
