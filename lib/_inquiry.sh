#!/bin/bash

# Função para exibir um banner de cabeçalho
print_banner() {
  echo "#######################################"
  echo "#                                     #"
  echo "#       Gerenciador Apexchat          #"
  echo "#                                     #"
  echo "#######################################"
}

# Função para coletar a senha root do MySQL
get_mysql_root_password() {
  print_banner
  printf "${WHITE} 💻 Insira senha para o usuario Deploy e Banco de Dados (Não utilizar caracteres especiais):${GRAY_LIGHT}\n\n"
  read -s -p "> " mysql_root_password
  echo
}

# Função para coletar o link do GitHub
get_link_git() {
  print_banner
  printf "${WHITE} 💻 Insira o link do GITHUB do Whaticket que deseja instalar:${GRAY_LIGHT}\n\n"
  read -p "> " link_git
}

# Função para coletar o nome da instância
get_instancia_add() {
  print_banner
  printf "${WHITE} 💻 Informe um nome para a Instancia/Empresa que será instalada (Não utilizar espaços ou caracteres especiais, Utilizar Letras minusculas; ):${GRAY_LIGHT}\n\n"
  read -p "> " instancia_add
}

# Função para coletar a quantidade máxima de conexões
get_max_whats() {
  print_banner
  printf "${WHITE} 💻 Informe a Qtde de Conexões/Whats que a ${instancia_add} poderá cadastrar:${GRAY_LIGHT}\n\n"
  read -p "> " max_whats
}

# Função para coletar a quantidade máxima de usuários
get_max_user() {
  print_banner
  printf "${WHITE} 💻 Informe a Qtde de Usuarios/Atendentes que a ${instancia_add} poderá cadastrar:${GRAY_LIGHT}\n\n"
  read -p "> " max_user
}

# Função para coletar a URL do frontend
get_frontend_url() {
  print_banner
  printf "${WHITE} 💻 Digite o domínio do FRONTEND/PAINEL para a ${instancia_add}:${GRAY_LIGHT}\n\n"
  read -p "> " frontend_url
}

# Função para coletar a URL do backend
get_backend_url() {
  print_banner
  printf "${WHITE} 💻 Digite o domínio do BACKEND/API para a ${instancia_add}:${GRAY_LIGHT}\n\n"
  read -p "> " backend_url
}

# Função para coletar a porta do frontend
get_frontend_port() {
  print_banner
  printf "${WHITE} 💻 Digite a porta do FRONTEND para a ${instancia_add}; Ex: 3000 A 3999 ${GRAY_LIGHT}\n\n"
  read -p "> " frontend_port
}

# Função para coletar a porta do backend
get_backend_port() {
  print_banner
  printf "${WHITE} 💻 Digite a porta do BACKEND para esta instancia; Ex: 4000 A 4999 ${GRAY_LIGHT}\n\n"
  read -p "> " backend_port
}

# Função para coletar a porta do Redis
get_redis_port() {
  print_banner
  printf "${WHITE} 💻 Digite a porta do REDIS/AGENDAMENTO MSG para a ${instancia_add}; Ex: 5000 A 5999 ${GRAY_LIGHT}\n\n"
  read -p "> " redis_port
}

# Função para coletar o nome da instância a ser deletada
get_empresa_delete() {
  print_banner
  printf "${WHITE} 💻 Digite o nome da Instancia/Empresa que será Deletada (Digite o mesmo nome de quando instalou):${GRAY_LIGHT}\n\n"
  read -p "> " empresa_delete
}

# Função para coletar o nome da instância a ser atualizada
get_empresa_atualizar() {
  print_banner
  printf "${WHITE} 💻 Digite o nome da Instancia/Empresa que deseja Atualizar (Digite o mesmo nome de quando instalou):${GRAY_LIGHT}\n\n"
  read -p "> " empresa_atualizar
}

# Função para coletar o nome da instância a ser bloqueada
get_empresa_bloquear() {
  print_banner
  printf "${WHITE} 💻 Digite o nome da Instancia/Empresa que deseja Bloquear (Digite o mesmo nome de quando instalou):${GRAY_LIGHT}\n\n"
  read -p "> " empresa_bloquear
}

# Função para coletar o nome da instância a ser desbloqueada
get_empresa_desbloquear() {
  print_banner
  printf "${WHITE} 💻 Digite o nome da Instancia/Empresa que deseja Desbloquear (Digite o mesmo nome de quando instalou):${GRAY_LIGHT}\n\n"
  read -p "> " empresa_desbloquear
}

# Função para coletar o nome da instância para alterar domínios
get_empresa_dominio() {
  print_banner
  printf "${WHITE} 💻 Digite o nome da Instancia/Empresa que deseja Alterar os Dominios (Atenção para alterar os dominios precisa digitar os 2, mesmo que vá alterar apenas 1):${GRAY_LIGHT}\n\n"
  read -p "> " empresa_dominio
}

# Função para coletar o novo domínio do frontend
get_alter_frontend_url() {
  print_banner
  printf "${WHITE} 💻 Digite o NOVO domínio do FRONTEND/PAINEL para a ${empresa_dominio}:${GRAY_LIGHT}\n\n"
  read -p "> " alter_frontend_url
}

# Função para coletar o novo domínio do backend
get_alter_backend_url() {
  print_banner
  printf "${WHITE} 💻 Digite o NOVO domínio do BACKEND/API para a ${empresa_dominio}:${GRAY_LIGHT}\n\n"
  read -p "> " alter_backend_url
}

# Função para coletar a porta do frontend a ser alterada
get_alter_frontend_port() {
  print_banner
  printf "${WHITE} 💻 Digite a porta do FRONTEND da Instancia/Empresa ${empresa_dominio}; A porta deve ser o mesma informada durante a instalação ${GRAY_LIGHT}\n\n"
  read -p "> " alter_frontend_port
}

# Função para coletar a porta do backend a ser alterada
get_alter_backend_port() {
  print_banner
  printf "${WHITE} 💻 Digite a porta do BACKEND da Instancia/Empresa ${empresa_dominio}; A porta deve ser o mesma informada durante a instalação ${GRAY_LIGHT}\n\n"
  read -p "> " alter_backend_port
}

# Função para coletar todas as URLs necessárias
get_urls() {
  get_mysql_root_password
  get_link_git
  get_instancia_add
  get_max_whats
  get_max_user
  get_frontend_url
  get_backend_url
  get_frontend_port
  get_backend_port
  get_redis_port
}

# Função para atualizar o software
software_update() {
  get_empresa_atualizar
  frontend_update
  backend_update
}

# Função para deletar o software
software_delete() {
  get_empresa_delete
  deletar_tudo
}

# Função para bloquear o software
software_bloquear() {
  get_empresa_bloquear
  configurar_bloqueio
}

# Função para desbloquear o software
software_desbloquear() {
  get_empresa_desbloquear
  configurar_desbloqueio
}

# Função para alterar os domínios do software
software_dominio() {
  get_empresa_dominio
  get_alter_frontend_url
  get_alter_backend_url
  get_alter_frontend_port
  get_alter_backend_port
  configurar_dominio
}

# Função para exibir as opções de consulta
inquiry_options() {
  print_banner
  printf "${WHITE} 💻 Bem vindo(a) ao Gerenciador Apexchat, Selecione abaixo a proxima ação!${GRAY_LIGHT}\n\n"
  printf "   [0] Instalar whaticket\n"
  printf "   [1] Atualizar whaticket\n"
  printf "   [2] Deletar Whaticket\n"
  printf "   [3] Bloquear Whaticket\n"
  printf "   [4] Desbloquear Whaticket\n"
  printf "   [5] Alterar domínio Whaticket\n"
  printf "\n"
  read -p "> " option

  case "${option}" in
    0) 
      get_urls
      # Chame a função de instalação aqui (não incluída no script fornecido)
      ;;
    1) 
      software_update 
      ;;
    2) 
      software_delete 
      ;;
    3) 
      software_bloquear 
      ;;
    4) 
      software_desbloquear 
      ;;
    5) 
      software_dominio 
      ;;
    *) 
      exit ;;
  esac
}

# Executa a função de exibição de opções
inquiry_options
