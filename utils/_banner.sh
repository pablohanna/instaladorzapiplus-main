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
  printf "                                                     ▄▄█▀▀▀▀▀▀▀█▄▄  \n";
  printf "                                                   ${CYAN_LIGHT}▄█▀${NC}   ${WHITE}▄▄${NC}      ${CYAN_LIGHT}▀█▄\n";
  printf "                                                   ${CYAN_LIGHT█${NC}    ${WHITE}███${NC}         ${CYAN_LIGHT}█\n";
  printf "                                                   ${CYAN_LIGHT}█${NC}    ${WHITE}██▄         ${CYAN_LIGHT}█${NC}\n";
  printf "                                                   ${CYAN_LIGHT}█${NC}     ${WHITE}▀██▄${NC} ${WHITE}██${NC}    ${CYAN_LIGHT}█\n";
  printf "                                                   ${CYAN_LIGHT}█${NC}       ${WHITE}▀███▀${NC}    ${CYAN_LIGHT}█\n";
  printf "                                                   ${CYAN_LIGHT}▀█▄           ▄█▀\n";
  printf "                                                    ▄█    ▄▄▄▄█▀▀  \n";
  printf "                                                    █  ▄█▀        \n";
  printf "                                                    ▀▀▀▀          \n";
  printf "${NC}";

  printf "${CYAN_LIGHT}"

  printf "${CYAN_LIGHT}  _______  __    __       ___       __   __  ___   __    __       ${NC}\n"
  printf "${CYAN_LIGHT} |       ||  |  |  |     /   \\     |  | |  ||   | |  |  |  |      ${NC}\n"
  printf "${CYAN_LIGHT} |  .--. ||  |__|  |    /  ^  \\    |  | |  ||   | |   \\/   |      ${NC}\n"
  printf "${CYAN_LIGHT} |  |  | ||   __   |   /  /_\  \\   |  |_|  ||   |  \\      /       ${NC}\n"
  printf "${CYAN_LIGHT} |  '--' ||  |  |  |  /  _____  \\  |       ||   |   \\    /        ${NC}\n"
  printf "${CYAN_LIGHT} |_______||__|  |__| /__/     \\__\\ |_______||___|    \\__/         ${NC}\n"

  
  printf "                ${NC}[${CYAN_LIGHT}Whaticket Label${NC}]${CYAN_LIGHT}\n"

  printf "${NC}"
}
