#!/bin/bash

# System update
sudo apt-get update

# System upgrade
sudo apt-get upgrade -y

# System update
sudo apt-get update

# Install vim
sudo apt-get install vim-nox -y

# Install vim plug manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install git
sudo apt-get install git -y

# Install YCM required package
sudo apt install build-essential cmake python3-dev -y

# Install Universal Ctags
sudo apt-get install -y ctags

# Install zsh
sudo apt-get install -y zsh

# Change user default shell to zsh
sudo chsh -s /bin/zsh elliot

# Install Oh-my-zsh
cd ~
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install hack font
sudo apt-get install fonts-hack-ttf -y

# Override .zshrc
cp ~/Mylinux/.zshrc .

# Install Gnome terminal theme
bash -c  "$(wget -qO- https://git.io/vQgMr)"

# Install work enviroment
if [ $1 = "work" ]
then
    sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat libsdl1.2-dev xterm make xsltproc docbook-utils fop dblatex xmlto autoconf automake libtool libglib2.0-dev python-gtk2 bsdmainutils screen -y
fi

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

