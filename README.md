system-config
=============

Configuration for linux system

Initial packages
==================
arc-gtk-theme
arc-icon-theme
dhcpcd
dmenu
easyeffects
emacs
eog
firefox
gtk-chtheme
i3status
iwd
lxappearance
nano
nitrogen
openssh
pavucontrol
pipewire-pulse
pipewire
sudo
terminator
thunar
ttf-inconsolata
vi
xorg-server
xorg-xinit
xorg-xrandr
xorg-xwayland

Development packages
=====================
pacman -S --needed base-devel

Display
========
Copy .xinitrc into ~
Copy set-monitors.sh into ~ and update for hardware

Login Screen
=============
lightdm
lightdm-webkit2-greeter

AUR:
https://aur.archlinux.org/lightdm-webkit-theme-aether.git

sudo systemctl enable lightdm.service


SSH
====
mkdir .ssh
chmod 644 .ssh


Themes
=======
Arc dark
arc-icon-theme
Use lxappearance and gtk-chtheme to set themes in i3.


ARM build toolchain
=====================


Hardware Design
================
kicad
kicad-library
kicad-library-3d

Add Eagle Dark theme

3D Printing
============
cura

3D Modelling
=============
openscad (Tomorrow night bright theme for preview and editor panels)
freecad (AppImage)

Scanning
=========
xsane