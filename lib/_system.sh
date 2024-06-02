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

# Função para criar um usuário
system_create_user() {
  print_banner
  printf "${WHITE} 💻 Agora, vamos criar o usuário para a instancia...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  useradd -m -p $(openssl passwd -crypt ${mysql_root_password}) -s /bin/bash -G sudo deploy
  usermod -aG sudo deploy
EOF

  sleep 2
}

# Função para clonar repositórios usando git
system_git_clone() {
  print_banner
  printf "${WHITE} 💻 Fazendo download do código Whaticket...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - deploy <<EOF
  git clone ${link_git} /home/deploy/${instancia_add}/
EOF

  sleep 2
}

# Função para atualizar o sistema
system_update() {
  print_banner
  printf "${WHITE} 💻 Vamos atualizar o sistema Whaticket...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  apt -y update
  sudo apt-get install -y libxshmfence-dev libgbm-dev wget unzip fontconfig locales gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils
EOF

  sleep 2
}

# Função para deletar o sistema
deletar_tudo() {
  print_banner
  printf "${WHITE} 💻 Vamos deletar o Whaticket...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  docker container rm redis-${empresa_delete} --force
  cd && rm -rf /etc/nginx/sites-enabled/${empresa_delete}-frontend
  cd && rm -rf /etc/nginx/sites-enabled/${empresa_delete}-backend  
  cd && rm -rf /etc/nginx/sites-available/${empresa_delete}-frontend
  cd && rm -rf /etc/nginx/sites-available/${empresa_delete}-backend
  
  sleep 2

  sudo su - postgres
  dropuser ${empresa_delete}
  dropdb ${empresa_delete}
  exit
EOF

  sleep 2

  sudo su - deploy <<EOF
  rm -rf /home/deploy/${empresa_delete}
  pm2 delete ${empresa_delete}-frontend ${empresa_delete}-backend
  pm2 save
EOF

  sleep 2

  print_banner
  printf "${WHITE} 💻 Remoção da Instancia/Empresa ${empresa_delete} realizado com sucesso ...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2
}

# Função para bloquear o sistema
configurar_bloqueio() {
  print_banner
  printf "${WHITE} 💻 Vamos bloquear o Whaticket...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - deploy <<EOF
  pm2 stop ${empresa_bloquear}-backend
  pm2 save
EOF

  sleep 2

  print_banner
  printf "${WHITE} 💻 Bloqueio da Instancia/Empresa ${empresa_bloquear} realizado com sucesso ...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2
}

# Função para desbloquear o sistema
configurar_desbloqueio() {
  print_banner
  printf "${WHITE} 💻 Vamos Desbloquear o Whaticket...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - deploy <<EOF
  pm2 start ${empresa_desbloquear}-backend
  pm2 save
EOF

  sleep 2

  print_banner
  printf "${WHITE} 💻 Desbloqueio da Instancia/Empresa ${empresa_desbloquear} realizado com sucesso ...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2
}

# Função para alterar domínios do sistema
configurar_dominio() {
  print_banner
  printf "${WHITE} 💻 Vamos Alterar os Dominios do Whaticket...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  cd && rm -rf /etc/nginx/sites-enabled/${empresa_dominio}-frontend
  cd && rm -rf /etc/nginx/sites-enabled/${empresa_dominio}-backend  
  cd && rm -rf /etc/nginx/sites-available/${empresa_dominio}-frontend
  cd && rm -rf /etc/nginx/sites-available/${empresa_dominio}-backend
EOF

  sleep 2

  sudo su - deploy <<EOF
  cd && cd /home/deploy/${empresa_dominio}/frontend
  sed -i "1c\REACT_APP_BACKEND_URL=https://${alter_backend_url}" .env
  cd && cd /home/deploy/${empresa_dominio}/backend
  sed -i "2c\BACKEND_URL=https://${alter_backend_url}" .env
  sed -i "3c\FRONTEND_URL=https://${alter_frontend_url}" .env 
EOF

  sleep 2

  backend_hostname=$(echo "${alter_backend_url/https:\/\/}")

  sudo su - root <<EOF
  cat > /etc/nginx/sites-available/${empresa_dominio}-backend << 'END'
server {
  server_name $backend_hostname;
  location / {
    proxy_pass http://127.0.0.1:${alter_backend_port};
    proxy_http_version 1.1;
    proxy_set_header Upgrade \$http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host \$host;
    proxy_set_header X-Real-IP \$remote_addr;
    proxy_set_header X-Forwarded-Proto \$scheme;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    proxy_cache_bypass \$http_upgrade;
  }
}
END
ln -s /etc/nginx/sites-available/${empresa_dominio}-backend /etc/nginx/sites-enabled
EOF

  sleep 2

  frontend_hostname=$(echo "${alter_frontend_url/https:\/\/}")

  sudo su - root <<EOF
  cat > /etc/nginx/sites-available/${empresa_dominio}-frontend << 'END'
server {
  server_name $frontend_hostname;
  location / {
    proxy_pass http://127.0.0.1:${alter_frontend_port};
    proxy_http_version 1.1;
    proxy_set_header Upgrade \$http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host \$host;
    proxy_set_header X-Real-IP \$remote_addr;
    proxy_set_header X-Forwarded-Proto \$scheme;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    proxy_cache_bypass \$http_upgrade;
  }
}
END
ln -s /etc/nginx/sites-available/${empresa_dominio}-frontend /etc/nginx/sites-enabled
EOF

  sleep 2

  sudo su - root <<EOF
  service nginx restart
EOF

  sleep 2

  backend_domain=$(echo "${backend_url/https:\/\/}")
  frontend_domain=$(echo "${frontend_url/https:\/\/}")

  sudo su - root <<EOF
  certbot -m $deploy_email \
          --nginx \
          --agree-tos \
          --non-interactive \
          --domains $backend_domain,$frontend_domain
EOF

  sleep 2

  print_banner
  printf "${WHITE} 💻 Alteração de dominio da Instancia/Empresa ${empresa_dominio} realizado com sucesso ...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2
}

# Função para instalar o Node.js
system_node_install() {
  print_banner
  printf "${WHITE} 💻 Instalando nodejs...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
  apt-get install -y nodejs
  sleep 2
  npm install -g npm@latest
  sleep 2
  sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
  sudo apt-get update -y && sudo apt-get -y install postgresql
  sleep 2
  sudo timedatectl set-timezone America/Sao_Paulo
EOF

  sleep 2
}

# Função para instalar o Docker
system_docker_install() {
  print_banner
  printf "${WHITE} 💻 Instalando docker...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  apt install -y apt-transport-https \
                 ca-certificates curl \
                 software-properties-common

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
  
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

  apt install -y docker-ce
EOF

  sleep 2
}

# Função para instalar as dependências do Puppeteer
system_puppeteer_dependencies() {
  print_banner
  printf "${WHITE} 💻 Instalando puppeteer dependencies...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  apt-get install -y libxshmfence-dev \
                      libgbm-dev \
                      wget \
                      unzip \
                      fontconfig \
                      locales \
                      gconf-service \
                      libasound2 \
                      libatk1.0-0 \
                      libc6 \
                      libcairo2 \
                      libcups2 \
                      libdbus-1-3 \
                      libexpat1 \
                      libfontconfig1 \
                      libgcc1 \
                      libgconf-2-4 \
                      libgdk-pixbuf2.0-0 \
                      libglib2.0-0 \
                      libgtk-3-0 \
                      libnspr4 \
                      libpango-1.0-0 \
                      libpangocairo-1.0-0 \
                      libstdc++6 \
                      libx11-6 \
                      libx11-xcb1 \
                      libxcb1 \
                      libxcomposite1 \
                      libxcursor1 \
                      libxdamage1 \
                      libxext6 \
                      libxfixes3 \
                      libxi6 \
                      libxrandr2 \
                      libxrender1 \
                      libxss1 \
                      libxtst6 \
                      ca-certificates \
                      fonts-liberation \
                      libappindicator1 \
                      libnss3 \
                      lsb-release \
                      xdg-utils
EOF

  sleep 2
}

# Função para instalar o PM2
system_pm2_install() {
  print_banner
  printf "${WHITE} 💻 Instalando pm2...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  npm install -g pm2
EOF

  sleep 2
}

# Função para instalar o Snapd
system_snapd_install() {
  print_banner
  printf "${WHITE} 💻 Instalando snapd...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  apt install -y snapd
  snap install core
  snap refresh core
EOF

  sleep 2
}

# Função para instalar o Certbot
system_certbot_install() {
  print_banner
  printf "${WHITE} 💻 Instalando certbot...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  apt-get remove certbot
  snap install --classic certbot
  ln -s /snap/bin/certbot /usr/bin/certbot
EOF

  sleep 2
}

# Função para instalar o Nginx
system_nginx_install() {
  print_banner
  printf "${WHITE} 💻 Instalando nginx...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  apt install -y nginx
  rm /etc/nginx/sites-enabled/default
EOF

  sleep 2
}

# Função para reiniciar o Nginx
system_nginx_restart() {
  print_banner
  printf "${WHITE} 💻 Reiniciando nginx...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  service nginx restart
EOF

  sleep 2
}

# Função para configurar o Nginx
system_nginx_conf() {
  print_banner
  printf "${WHITE} 💻 Configurando nginx...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  cat > /etc/nginx/conf.d/deploy.conf << 'END'
client_max_body_size 100M;
END
EOF

  sleep 2
}

# Função para configurar o Certbot
system_certbot_setup() {
  print_banner
  printf "${WHITE} 💻 Configurando certbot...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  backend_domain=$(echo "${backend_url/https:\/\/}")
  frontend_domain=$(echo "${frontend_url/https:\/\/}")

  sudo su - root <<EOF
  certbot -m $deploy_email \
          --nginx \
          --agree-tos \
          --non-interactive \
          --domains $backend_domain,$frontend_domain
EOF

  sleep 2
}

