#!/bin/bash
#
# Print banner art.

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

printf "${CYAN_LIGHT}";

  printf "${CYAN_LIGHT}  _______  __    __       ___       __   __  ___   __    __       ${NC}\n"
  printf "${CYAN_LIGHT} |       ||  |  |  |     /   \\     |  | |  ||   | |  |  |  |      ${NC}\n"
  printf "${CYAN_LIGHT} |  .--. ||  |__|  |    /  ^  \\    |  | |  ||   | |   \\/   |      ${NC}\n"
  printf "${CYAN_LIGHT} |  |  | ||   __   |   /  /_\  \\   |  |_|  ||   |  \\      /       ${NC}\n"
  printf "${CYAN_LIGHT} |  '--' ||  |  |  |  /  _____  \\  |       ||   |   \\    /        ${NC}\n"
  printf "${CYAN_LIGHT} |_______||__|  |__| /__/     \\__\\ |_______||___|    \\__/         ${NC}\n"

   printf "            \033[1;33m        © CANAL ChatBoard Channel - https://www.youtube.com/channel/UCMa9UDt137xjIEOxTwwL-Xw";
  printf "${NC}";

  printf "\n"
}