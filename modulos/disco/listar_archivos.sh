#!/bin/bash

listar_archivos() {
  while true; do
    echo "=== Listador de Archivos ==="
    echo "Seleccione el directorio a listar:"
    echo "1) Directorio actual"
    echo "2) Directorio HOME"
    echo "3) Directorio ROOT"
    echo "4) Ingresar ruta manual"
    echo "5) Ver todos los archivos del disco"
    echo "6) Volver al menú anterior"

    read -p "Opción [1-6]: " opcion

    case $opcion in
      1) dir="." ;;
      2) dir="/home" ;;
      3) dir="/root" ;;
      4) read -p "Ingrese la ruta del directorio: " dir ;;
      5) dir="/" ;;
      6) return ;; 
      *) echo "Opción inválida"; continue ;;
    esac

    if [ ! -d "$dir" ]; then
      echo "El directorio '$dir' no existe."
      continue
    fi

    echo "Seleccione el tipo de listado:"
    echo "1) Listado Simple"
    echo "2) Listado Completo"
    echo "3) Listado Simple y Recursivo"
    echo "4) Listado Completo y Recursivo"
    echo "5) Cancelar y volver al inicio"

    read -p "Opción [1-5]: " modo

    case $modo in
      1) cmd="ls \"$dir\"" ;;
      2) cmd="ls -l \"$dir\"" ;;
      3) cmd="ls -R \"$dir\"" ;;
      4) cmd="ls -lR \"$dir\"" ;;
      5) continue ;;
      *) echo "Opción inválida"; continue ;;
    esac

    echo "Ejecutando: $cmd"
    echo "----------------------------------"
    eval $cmd
    echo "----------------------------------"
    
    read -p "Presione ENTER para volver al menú de listado..."
  done
}
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  listar_archivos
fi
