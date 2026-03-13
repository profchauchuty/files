#!/bin/bash

echo "Atualizando sistema..."
sudo apt update && sudo apt upgrade -y

echo "Instalando dependências..."
sudo apt install -y curl wget git build-essential snapd software-properties-common

echo "Instalando VS Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code

echo "Instalando Node.js (LTS) e npm..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

echo "Instalando Python e pip..."
sudo apt install -y python3 python3-pip

echo "Instalando MySQL Server e Workbench..."
sudo apt install -y mysql-server mysql-workbench

echo "Instalando Java (necessário para BRModelo)..."
sudo apt install -y default-jre

echo "Instalando BRModelo..."
wget https://github.com/bernardopasquali/brModeloNext/releases/latest/download/brModelo.jar -O brmodelo.jar
sudo mv brmodelo.jar /opt/brmodelo.jar

sudo bash -c 'cat <<EOF > /usr/share/applications/brmodelo.desktop
[Desktop Entry]
Name=BRModelo
Exec=java -jar /opt/brmodelo.jar
Icon=java
Type=Application
Categories=Development;
EOF'

echo "Instalando Power BI Desktop (snap)..."
sudo snap install powerbi-desktop

echo "Baixando XAMPP..."
wget https://www.apachefriends.org/xampp-files/8.2.12/xampp-linux-x64-8.2.12-0-installer.run -O xampp.run
chmod +x xampp.run

echo "Execute manualmente para instalar o XAMPP:"
echo "sudo ./xampp.run"

echo "Instalação de softwares concluída!"
