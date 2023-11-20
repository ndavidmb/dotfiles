#!/bin/bash

apt-get update

apt-get install \
  nodejs \
  npm \
  ripgrep \
  fd-find \
  gnome-tweak-tool \
  neovim \
  tilix \
  zsh \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-compose-plugin \
  fzf \
  tree \
  apt-transport-https \
  ca-certificates \
  gnupg


echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg

apt-get install google-cloud-cli

chsh -s $(which zsh)
