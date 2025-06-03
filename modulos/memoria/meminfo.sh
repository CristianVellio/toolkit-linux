#!/bin/bash

# Se verifica si el archivo /proc/meminfo existe antes de intentar la lectura
if [ -f "/proc/meminfo" ]; then
   # Si el archivo existe, se procede a leer las primeras líneas
   # El comando 'head' muestra por defecto las primeras 10 líneas.
   # En el caso de querer ver más o menos líneas, se puede utilizar 'head -n X /proc/meminfo'
   echo "Mostrar las primeras líneas de /proc/meminfo:"
   head /proc/meminfo
else
   # Si el archivo no existe, se muestra un mensaje de error.
   echo "Error: El archivo /proc/meminfo no se encontró."
fi

exit 0 #Se sale del script con un código de éxito (0).

