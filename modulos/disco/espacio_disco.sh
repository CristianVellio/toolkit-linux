#!/bin/bash

# Colores
CYAN='\033[1;36m'
NC='\033[0m' # Reset color

clear
echo -e "${CYAN}======================================================"
echo -e "      INFORME DE USO DE ESPACIO EN DISCO"
echo -e "======================================================${NC}\n"
echo ""
echo "Sistema de archivos | Tamaño | Usado | Libre | % Usado | Punto de montaje"
echo "--------------------------------------------------------------------------"
df -h --output=source,size,used,avail,pcent,target | tail -n +2
echo ""
echo -e "${CYAN}======================================================${NC}"
echo ""
read -p "Presiona Enter para volver al menú principal..."

bash main.sh;