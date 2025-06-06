# Colores opcionales
RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"
NC="\e[0m" # Sin color

while true; do
  clear
  echo -e "${CYAN}================================================${NC}"
  echo -e "${CYAN}Toolkit de Administración Jr. - Disco y Archivos${NC}"
  echo -e "${CYAN}================================================${NC}"
  echo "1) Ver espacio libre/usado en discos montados"
  echo "2) Calcular tamaño de archivo/directorio"
  echo "3) Listar archivos de un directorio"
  echo "4) Volver al menú principal"
  echo "----------------------------------------------"

  read -rp "Ingresa el número de tu opción: " opcion

  case $opcion in
    1) ./modulos/disco/espacio_disco.sh ;;
    2) ./modulos/disco/???.sh ;;
    3) ./modulos/disco/listar_archivos.sh ;;
    4) break ;;
    *) echo -e "${RED}Opción inválida. Intenta nuevamente.${NC}"; sleep 2 ;;
  esac
done
