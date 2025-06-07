#!/bin/bash

mostrar_ram_swap() {
  local CYAN="\e[36m"
  local NC="\e[0m"

  clear
  echo -e "${CYAN}Su uso de RAM y SWAP:${NC}"
  echo "----------------------------------"
  free -h

  echo ""
  read -rp "Presioná Enter para volver al menú..."
}

mostrar_ram_swap

