#!/usr/bin/env bash

pkg.install() {
	# install vim
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' vim|grep "install ok installed")
	if [ "" == "$PKG_OK" ]; then
  		sudo apt-get --force-yes --yes install vim
	fi

	# install vundle
	git.clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	
	# install plugins
	vim +PluginInstall +qall
}

pkg.link() {
	fs.link_rfile vimrc $HOME/.vimrc
}

pkg.uninstall() {
	# remove vim 
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' vim|grep "install ok installed")
	if [ ! "" == "$PKG_OK" ]; then
  		sudo apt-get autoremove --purge vim 
	fi

	# remove vim folder
    	rm -rf $HOME/.vim
}

pkg.unlink() {
	rm -f $HOME/.vimrc
}
