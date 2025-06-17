# NixOS configuration

## Create a symbolic link

You have to remove any existing ´/etc/nixos/´ folder to create a symbolic link.

´´´bash
sudo mv /etc/nixos /etc/nixos.bak
sudo ln -s ~/nixos /etc/nixos
´´´
