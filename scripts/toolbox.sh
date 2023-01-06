#!/bin/bash
#===============================================================================
#
#          FILE:  toolbox.sh
# 
#         USAGE:  ./toolbox.sh 
# 
#   DESCRIPTION:  Programa para instalar automaticamente la mayor cantidad de programas mas importantes a mi perspectiva
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Jose - Blackshark (), 
#       COMPANY:  Evilcompany
#       VERSION:  1.0
#       CREATED:  04/01/23 23:47:30 CST
#      REVISION:  ---
#===============================================================================
echo "Nota, es importante tener instalado el paquete "yay", lo tienes? [s/n]"

read -p ">> " yayinstall
if [ $yayinstall == "s" ]; then
  clear
  echo "
Menu de Instalacion: 

(1) Desarrollo e Ingenieria
(2) Seguridad informatica
(3) Proteccion a la vista
(4) Entretenimiento y oficina
  "
  read -p ">> " select1

  if [ $select1 == 1 ]; then
    clear
    echo "Instalando Apps de desarrollo!"
    yay -S jupyterlab-desktop-bin --noconfirm
    sudo pacman -S code --noconfirm
    yay -S pseint --noconfirm
    sudo pacman -S obsidian --noconfirm

else 
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si

fi
