#!/bin/bash
#
# Print banner art.

# Cores
BG_BROWN='\033[48;5;94m'
NC='\033[0m'
WHITE='\033[1;37m'
CYAN_LIGHT='\033[1;36m'
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'

#######################################
# Print a board.
# Globals:
#   BG_BROWN
#   NC
#   WHITE
#   CYAN_LIGHT
#   RED
#   GREEN
#   YELLOW
# Arguments:
#   None
#######################################
print_banner() {
  clear
  printf "\n\n"
  printf "${RED}######################################################################${NC}\n"
  printf "${RED}##                                                                  ##${NC}\n"
  printf "${RED}##${NC}${WHITE}      _______  __    __       ___       __   __  ___   __    __      ${RED}##${NC}\n"
  printf "${RED}##${NC}${WHITE}     |       ||  |  |  |     /   \\     |  | |  ||   | |  |  |  |     ${RED}##${NC}\n"
  printf "${RED}##${NC}${WHITE}     |  .--. ||  |__|  |    /  ^  \\    |  | |  ||   | |   \\/   |     ${RED}##${NC}\n"
  printf "${RED}##${NC}${WHITE}     |  |  | ||   __   |   /  /_\  \\   |  |_|  ||   |  \\      /      ${RED}##${NC}\n"
  printf "${RED}##${NC}${WHITE}     |  '--' ||  |  |  |  /  _____  \\  |       ||   |   \\    /       ${RED}##${NC}\n"
  printf "${RED}##${NC}${WHITE}     |_______||__|  |__| /__/     \__\\ |_______||___|    \\__/        ${RED}##${NC}\n"
  printf "${RED}##                                                                  ##${NC}\n"
  printf "${RED}######################################################################${NC}\n"
  printf "\n${CYAN_LIGHT} © CANAL ChatBoard Channel - https://www.youtube.com/channel/UCMa9UDt137xjIEOxTwwL-Xw${NC}\n\n"
}
