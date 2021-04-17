#!/bin/bash

# System update
sudo apt-get update

# System upgrade
sudo apt-get upgrade -y

# Check script run permission
if [ "$(whoami)" == "root" ]; then
    echo "Script already request sudo permission, please run on normal user\
    do not install for root user"
    exit 255
fi
# Install vim
echo "[+] Install vim"
sudo apt-get install vim-nox -y

# Install ACK
sudo apt-get install ack silversearcher-ag -y
# Install vim plug manager
echo "[+] Install vimplugin"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# overrid .vimrc
echo "[/] Override .vimrc"
rm -rf ~/.vimrc
ln -s ./.vimrc ~/.vimrc

# Install git
echo "[+] Install git"
sudo apt-get install git -y

# Install YCM required package
echo "[+} Install YCM essential requirement, please build it by yourself in ~/.vim/plugged/YouCompleteMe"
sudo apt install build-essential cmake python3-dev -y

# Install Universal Ctags
echo "[+] Install ctags"
sudo apt-get install -y ctags

# Install zsh
echo "[+} Install Zsh"
sudo apt-get install -y zsh

# Change user default shell to zsh
echo "[/] Change shell to zsh"
sudo chsh -s /bin/zsh elliot

# Install Oh-my-zsh
echo "[+} Install Oh my zsh "
cd ~
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Override .zshrc
echo "[/] Update .zshrc"
rm -rf ~/.zshrc
ln -s ./.zshrc ~/.zshrc

# Install Gnome terminal theme
echo "[+} Install gnome terminal theme"
bash -c  "$(wget -qO- https://git.io/vQgMr)"

# Install Tmux
echo "[+] Install tmux"
sudo apt-get install tmux curl -y

# Install power line
echo "[+] Install powerline theme for tmux"
sudo apt-get install powerline -y

# Install power line font
echo "[+] Update powerline fonts"
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

# Path font to system
sudo mv PowerlineSymbols.otf /usr/share/fonts/
# Update font
sudo fc-cache -vf /usr/share/fonts/

# install font config file
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

# override tmux conf
echo "[/] Override tmux conf file"
rm -rf ~/.tmux.conf
ln -s ./.tmux.conf ~/.tmux.conf

# Install fzf
echo "[+] Install fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install vim plug manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

eco "All is set but you need to install NERD font if you want to use nerdtree in vim"


