#!/bin/bash
# 
# functions for setting up app frontend

print_banner() {
  echo "#######################################"
  echo "#                                     #"
  echo "#       Configuração do Frontend      #"
  echo "#                                     #"
  echo "#######################################"
}

#######################################
# instala pacotes do node
# Arguments:
#   None
#######################################
frontend_node_dependencies() {
  print_banner
  printf "${WHITE} 💻 Instalando dependências do frontend...${GRAY_LIGHT}\n\n"

  sleep 2

  sudo -u deploy bash <<EOF
  cd /home/deploy/${instancia_add}/frontend
  npm install --force
EOF

  sleep 2
}

#######################################
# compila código frontend
# Arguments:
#   None
#######################################
frontend_node_build() {
  print_banner
  printf "${WHITE} 💻 Compilando o código do frontend...${GRAY_LIGHT}\n\n"

  sleep 2

  sudo -u deploy bash <<EOF
  cd /home/deploy/${instancia_add}/frontend
  npm run build
EOF

  sleep 2
}

#######################################
# atualiza código frontend
# Arguments:
#   None
#######################################
frontend_update() {
  print_banner
  printf "${WHITE} 💻 Atualizando o frontend...${GRAY_LIGHT}\n\n"

  sleep 2

  sudo -u deploy bash <<EOF
  cd /home/deploy/${empresa_atualizar}
  pm2 stop ${empresa_atualizar}-frontend
  git pull
  cd /home/deploy/${empresa_atualizar}/frontend
  npm install
  rm -rf build
  npm run build
  pm2 start ${empresa_atualizar}-frontend
  pm2 save
EOF

  sleep 2
}

#######################################
# configura variáveis de ambiente do frontend
# Arguments:
#   None
#######################################
frontend_set_env() {
  print_banner
  printf "${WHITE} 💻 Configurando variáveis de ambiente (frontend)...${GRAY_LIGHT}\n\n"

  sleep 2

  backend_url=$(echo "${backend_url/https:\/\/}")
  backend_url=${backend_url%%/*}
  backend_url="https://${backend_url}"

  sudo -u deploy bash <<EOF
  cat <<EOL > /home/deploy/${instancia_add}/frontend/.env
REACT_APP_BACKEND_URL=${backend_url}
REACT_APP_HOURS_CLOSE_TICKETS_AUTO=24
EOL
EOF

  sleep 2

  sudo -u deploy bash <<EOF
  cat <<EOL > /home/deploy/${instancia_add}/frontend/server.js
// Simple express server to run frontend production build
const express = require("express");
const path = require("path");
const app = express();
app.use(express.static(path.join(__dirname, "build")));
app.get("/*", function (req, res) {
  res.sendFile(path.join(__dirname, "build", "index.html"));
});
app.listen(${frontend_port});
EOL
EOF

  sleep 2
}

#######################################
# inicia pm2 para frontend
# Arguments:
#   None
#######################################
frontend_start_pm2() {
  print_banner
  printf "${WHITE} 💻 Iniciando pm2 (frontend)...${GRAY_LIGHT}\n\n"

  sleep 2

  sudo -u deploy bash <<EOF
  cd /home/deploy/${instancia_add}/frontend
  pm2 start server.js --name ${instancia_add}-frontend
  pm2 save
EOF

  sleep 2
  
  sudo bash <<EOF
  pm2 startup systemd -u deploy --hp /home/deploy
EOF

  sleep 2
}

#######################################
# configura nginx para frontend
# Arguments:
#   None
#######################################
frontend_nginx_setup() {
  print_banner
  printf "${WHITE} 💻 Configurando nginx (frontend)...${GRAY_LIGHT}\n\n"

  sleep 2

  frontend_hostname=$(echo "${frontend_url/https:\/\/}")

  sudo bash <<EOF
cat > /etc/nginx/sites-available/${instancia_add}-frontend <<EOL
server {
  server_name ${frontend_hostname};

  location / {
    proxy_pass http://127.0.0.1:${frontend_port};
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

ln -s /etc/nginx/sites-available/${instancia_add}-frontend /etc/nginx/sites-enabled
EOF

  sleep 2
}
