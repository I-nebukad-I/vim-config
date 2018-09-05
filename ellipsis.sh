#!/usr/bin/env bash

pkg.install() {
	# install vim
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' vim|grep "install ok installed")
	if [ "" == "$PKG_OK" ]; then
  		sudo apt-get --force-yes --yes install vim
	fi

	# install cmake
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' cmake|grep "install ok installed")
	if [ "" == "$PKG_OK" ]; then
  		sudo apt-get --force-yes --yes install cmake 
	fi
	
	# install python
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' python|grep "install ok installed")
	if [ "" == "$PKG_OK" ]; then
  		sudo apt-get --force-yes --yes install python
	fi
	
	# install python-dev
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' python-dev|grep "install ok installed")
	if [ "" == "$PKG_OK" ]; then
  		sudo apt-get --force-yes --yes install python-dev
	fi

	# install vundle
	git.clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}

pkg.link() {
	fs.link_rfile vimrc $HOME/.vimrc
	
	# install plugins
	vim +PluginInstall +qall -u vimrc

	# install YouCompleteMe
	if [ -f "$HOME/.vim/bundle/youcompleteme/install.py" ]; then
		"$HOME/.vim/bundle/youcompleteme/install.py"
	fi
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
