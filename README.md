# instaladorzapiplus-main
 
FAZENDO DOWNLOAD DO INSTALADOR & INICIANDO A PRIMEIRA INSTALAÇÃO (USAR SOMENTE PARA PRIMEIRA INSTALAÇÃO):


sudo apt -y update && apt -y upgrade


```bash
sudo apt install -y git && git clone https://github.com/pablohanna/instaladorzapiplus-main && sudo chmod -R 777 instaladorzapiplus-main && cd instaladorzapiplus-main && sudo ./install_primaria
```

ACESSANDO DIRETORIO DO INSTALADOR & INICIANDO INSTALAÇÕES ADICIONAIS (USAR ESTE COMANDO PARA SEGUNDA OU MAIS INSTALAÇÃO:
```bash
cd ./instaladorzapiplus-main && sudo ./install_instancia
```

