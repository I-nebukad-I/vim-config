#!/usr/bin/env bash

pkg.install() {
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' vim|grep "install ok installed")
	if [ "" == "$PKG_OK" ]; then
  		sudo apt-get --force-yes --yes install vim
	fi

    vim +PluginInstall +qall
}

pkg.link() {
	fs.link_rfile .vimrc $HOME/.vimrc
}

pkg.uninstall() {
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' vim|grep "install ok installed")
	if [ ! "" == "$PKG_OK" ]; then
  		sudo apt-get autoremove --purge vim 
    fi

    rm -rf $HOME/.vim
}

pkg.unlink() {
	rm -f $HOME/.vimrc
}
