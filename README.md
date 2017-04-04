# dotvim

git clone https://github.com/txowista/myVimConfig.git ~/.vim 

install -d ~/.config 

ln -s ~/.vim ~/.config/nvim 

ln -s ~/.vim/vimrc ~/.vimrc 

cd ~/.vim/

git submodule update --init --recursive 

vim -c :PlugInstall
