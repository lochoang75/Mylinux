#!/bin/bash

# System update
sudo apt-get update

# System upgrade
sudo apt-get upgrade -y

# Add vim 8 repository
sudo add-apt-repository ppa:jonathonf/vim

# System update
sudo apt-get update

# Install vim
sudo apt-get install vim -y

# Install git
sudo apt-get install git -y

# Install Ultimate vim confi
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Clone personal linux config
git clone https://github.com/lochoang75/Mylinux.git

# Move vim config file to override ultimateconfig
cp ~/Mylinux/*.vim ~/.vim_runtime/vimrcs/
mv ~/.vim_runtime/vimrcs/my_configs.vim ~/.vim_runtime/

# Install vim plugin
cd ~/.vim_runtime/my_plugins

# YCM is a completer support for fast code and reminder
# YCM generator is a generator support for c-family language
# Clone YCM
git clone https://github.com/ycm-core/YouCompleteMe.git

# Install YCM required package
sudo apt install build-essential cmake python3-dev -y

# Submodule update YCM
cd YouCompleteMe
git submodule update --init --recursive

# Build YCM
python3 install.py --clang-completer

# Install YCM-generator
cd ~/.vim_runtime/my_plugins
git clone https://github.com/rdnetto/YCM-Generator.git

# Install Gruvbox theme
cd ~/.vim_runtime/my_plugins
git clone https://github.com/morhetz/gruvbox.git

# Install Universal Ctags
sudo apt-get install -y ctags

# Install tagbar
cd ~/.vim_runtime/my_plugins
git clone https://github.com/majutsushi/tagbar.git

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

# Install zsh autosuggest
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

