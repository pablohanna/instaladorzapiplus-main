#!/bin/bash

print_banner() {
  echo "#######################################"
  echo "#                                     #"
  echo "#        Configuração do Backend      #"
  echo "#                                     #"
  echo "#######################################"
}

#######################################
# cria a db REDIS usando docker
# Arguments:
#   None
#######################################
backend_redis_create() {
  print_banner
  printf "${WHITE} 💻 Criando Redis & Banco Postgres...${GRAY_LIGHT}\n\n"

  sleep 2

  usermod -aG docker deploy
  docker run --name redis-${instancia_add} -p ${redis_port}:6379 --restart always --detach redis redis-server --requirepass ${mysql_root_password}
  
  sleep 2

  sudo -u postgres bash -c "createdb ${instancia_add}"
  sudo -u postgres bash -c "psql -c \"CREATE USER ${instancia_add} SUPERUSER INHERIT CREATEDB CREATEROLE PASSWORD '${mysql_root_password}'\""

  sleep 2
}

#######################################
# sets environment variable for backend.
# Arguments:
#   None
#######################################
backend_set_env() {
  print_banner
  printf "${WHITE} 💻 Configurando variáveis de ambiente (backend)...${GRAY_LIGHT}\n\n"

  sleep 2

  backend_url=$(echo "${backend_url/https:\/\/}")
  backend_url=${backend_url%%/*}
  backend_url="https://${backend_url}"

  frontend_url=$(echo "${frontend_url/https:\/\/}")
  frontend_url=${frontend_url%%/*}
  frontend_url="https://${frontend_url}"

sudo -u deploy bash <<EOF
  cat <<EOL > /home/deploy/${instancia_add}/backend/.env
NODE_ENV=
BACKEND_URL=${backend_url}
FRONTEND_URL=${frontend_url}
PROXY_PORT=443
PORT=${backend_port}

DB_DIALECT=postgres
DB_HOST=localhost
DB_PORT=5432
DB_USER=${instancia_add}
DB_PASS=${mysql_root_password}
DB_NAME=${instancia_add}

JWT_SECRET=${jwt_secret}
JWT_REFRESH_SECRET=${jwt_refresh_secret}

REDIS_URI=redis://:${mysql_root_password}@127.0.0.1:${redis_port}
REDIS_OPT_LIMITER_MAX=1
REGIS_OPT_LIMITER_DURATION=3000

USER_LIMIT=${max_user}
CONNECTIONS_LIMIT=${max_whats}
CLOSED_SEND_BY_ME=true
EOL
EOF

  sleep 2
}

#######################################
# instala dependências do node.js
# Arguments:
#   None
#######################################
backend_node_dependencies() {
  print_banner
  printf "${WHITE} 💻 Instalando dependências do backend...${GRAY_LIGHT}\n\n"

  sleep 2

  sudo -u deploy bash <<EOF
  cd /home/deploy/${instancia_add}/backend
  npm install --force
EOF

  sleep 2
}

#######################################
# compila código backend
# Arguments:
#   None
#######################################
backend_node_build() {
  print_banner
  printf "${WHITE} 💻 Compilando o código do backend...${GRAY_LIGHT}\n\n"

  sleep 2

  sudo -u deploy bash <<EOF
  cd /home/deploy/${instancia_add}/backend
  npm run build
EOF

  sleep 2
}

#######################################
# atualiza código frontend
# Arguments:
#   None
#######################################
backend_update() {
  print_banner
  printf "${WHITE} 💻 Atualizando o backend...${GRAY_LIGHT}\n\n"

  sleep 2

  sudo -u deploy bash <<EOF
  cd /home/deploy/${empresa_atualizar}
  pm2 stop ${empresa_atualizar}-backend
  git pull
  cd /home/deploy/${empresa_atualizar}/backend
  npm install
  npm update -f
  npm install @types/fs-extra
  rm -rf dist 
  npm run build
  npx sequelize db:migrate
  npx sequelize db:seed
  pm2 start ${empresa_atualizar}-backend
  pm2 save 
EOF

  sleep 2
}

#######################################
# executa db migrate
# Arguments:
#   None
#######################################
backend_db_migrate() {
  print_banner
  printf "${WHITE} 💻 Executando db:migrate...${GRAY_LIGHT}\n\n"

  sleep 2

  sudo -u deploy bash <<EOF
  cd /home/deploy/${instancia_add}/backend
  npx sequelize db:migrate
EOF

  sleep 2
}

#######################################
# executa db seed
# Arguments:
#   None
#######################################
backend_db_seed() {
  print_banner
  printf "${WHITE} 💻 Executando db:seed...${GRAY_LIGHT}\n\n"

  sleep 2

  sudo -u deploy bash <<EOF
  cd /home/deploy/${instancia_add}/backend
  npx sequelize db:seed:all
EOF

  sleep 2
}

#######################################
# inicia backend usando pm2 em modo produção.
# Arguments:
#   None
#######################################
backend_start_pm2() {
  print_banner
  printf "${WHITE} 💻 Iniciando pm2 (backend)...${GRAY_LIGHT}\n\n"

  sleep 2

  sudo -u deploy bash <<EOF
  cd /home/deploy/${instancia_add}/backend
  pm2 start dist/server.js --name ${instancia_add}-backend
EOF

  sleep 2
}

#######################################
# configura nginx para backend
# Arguments:
#   None
#######################################
backend_nginx_setup() {
  print_banner
  printf "${WHITE} 💻 Configurando nginx (backend)...${GRAY_LIGHT}\n\n"

  sleep 2

  backend_hostname=$(echo "${backend_url/https:\/\/}")

sudo bash <<EOF
cat > /etc/nginx/sites-available/${instancia_add}-backend <<EOL
server {
  server_name ${backend_hostname};
  location / {
    proxy_pass http://127.0.0.1:${backend_port};
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
EOL
ln -s /etc/nginx/sites-available/${instancia_add}-backend /etc/nginx/sites-enabled
EOF

  sleep 2
}
