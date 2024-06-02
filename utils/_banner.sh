#!/bin/bash
#
# Print banner art for ChatBoard Channel.

# Definição das cores
NC='\033[0m'            # No Color
WHITE='\033[1;37m'     # Branco
CYAN_LIGHT='\033[1;36m' # Ciano claro
RED='\033[1;31m'       # Vermelho

#######################################
# Função para imprimir o banner
# Globals:
#   NC
#   WHITE
#   CYAN_LIGHT
#   RED
# Arguments:
#   None
#######################################
print_banner() {
  clear  # Limpa a tela antes de imprimir o banner
  printf "\n\n"
  printf "${RED}##########################################################################${NC}\n"  # Linha superior do banner
  printf "${RED}##                                                                      ##${NC}\n"
  printf "${RED}##${NC}${WHITE}      _______  __    __       ___       __   __  ___   __    __      ${RED}##${NC}\n"
  printf "${RED}##${NC}${WHITE}     |       ||  |  |  |     /   \\     |  | |  ||   | |  |  |  |     ${RED}##${NC}\n"
  printf "${RED}##${NC}${WHITE}     |  .--. ||  |__|  |    /  ^  \\    |  | |  ||   | |   \\/   |     ${RED}##${NC}\n"
  printf "${RED}##${NC}${WHITE}     |  |  | ||   __   |   /  /_\  \\   |  |_|  ||   |  \\      /      ${RED}##${NC}\n"
  printf "${RED}##${NC}${WHITE}     |  '--' ||  |  |  |  /  _____  \\  |       ||   |   \\    /       ${RED}##${NC}\n"
  printf "${RED}##${NC}${WHITE}     |_______||__|  |__| /__/     \__\\ |_______||___|    \\__/        ${RED}##${NC}\n"
  printf "${RED}##                                                                      ##${NC}\n"  # Linha inferior do banner
  printf "${RED}##########################################################################${NC}\n\n"
  printf "                          ${CYAN_LIGHT}© ChatBoard Channel - https://www.youtube.com/channel/UCMa9UDt137xjIEOxTwwL-Xw${NC}\n\n"
  sleep 0.5  # Aguarda meio segundo antes de piscar
  clear  # Limpa a tela antes de reexibir o banner
  printf "\n\n"
  printf "${RED}##########################################################################${NC}\n"  
  printf "${RED}##                                                                      ##${NC}\n"
  printf "${RED}##${NC}${WHITE}      _______  __    __       ___       __   __  ___   __    __      ${RED}##${NC}\n"
  printf "${RED}##${NC}${WHITE}     |       ||  |  |  |     /   \\     |  | |  ||   | |  |  |  |     ${RED}##${NC}\n"
  printf "${RED}##${NC}${WHITE}     |  .--. ||  |__|  |    /  ^  \\    |  | |  ||   | |   \\/   |     ${RED}##${NC}\n"
  printf "${RED}##${NC}${WHITE}     |  |  | ||   __   |   /  /_\  \\   |  |_|  ||   |  \\      /      ${RED}##${NC}\n"
  printf "${RED}##${NC}${WHITE}     |  '--' ||  |  |  |  /  _____  \\  |       ||   |   \\    /       ${RED}##${NC}\n"
  printf "${RED}##${NC}${WHITE}     |_______||__|  |__| /__/     \__\\ |_______||___|    \\__/        ${RED}##${NC}\n"
  printf "${RED}##                                                                      ##${NC}\n"  
  printf "${RED}##########################################################################${NC}\n\n"
  printf "                          ${CYAN_LIGHT}© ChatBoard Channel - https://www.youtube.com/channel/UCMa9UDt137xjIEOxTwwL-Xw${NC}\n\n"
  sleep 0.5  # Aguarda meio segundo antes de piscar novamente
}

# Chamar a função para imprimir o banner
while true; do
  p
