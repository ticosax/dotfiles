REPO_PATH=~/src/

$(REPO_PATH)powerline-fonts:
	git clone https://github.com/Lokaltog/powerline-fonts.git $(REPO_PATH)powerline-fonts

~/.vim/bundle/vundle:
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

$(REPO_PATH)gnome-terminal-colors-solarized:
	# Solarized for terminal
	git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git $(REPO_PATH)gnome-terminal-colors-solarized

~/.ctags:
	ln -s `pwd`/ctags ~/.ctags

~/.bash_aliases:
	ln -s `pwd`/bash_aliases ~/.bash_aliases

~/.vimrc:
	rm -f ~/.vimrc
	ln -s `pwd`/vimrc ~/.vimrc

~/.ackrc:
	ln -s `pwd`/ackrc ~/.ackrc

install: $(REPO_PATH)powerline-fonts ~/.vim/bundle/vundle $(REPO_PATH)gnome-terminal-colors-solarized ~/.ctags ~/.bash_aliases ~/.vimrc ~/.ackrc
	# Vim stuff
	sudo apt-get install vim vim-gnome exuberant-ctags python-fontforge cmake python-dev ruby ruby-dev
	mkdir -p ~/.fonts/
	find ../powerline-fonts -name '*.otf' -exec cp {} -t $$HOME/.fonts/ \;
	fc-cache -vf ~/.fonts
	gconftool --set /apps/gnome-terminal/profiles/Default/font --type=string "Source Code Pro for Powerline Light 12"
	gconftool --set /apps/gnome-terminal/profiles/Default/use_system_font --type=bool "false"
	vim +BundleInstall +qall
	cd ~/.vim/bundle/jedi-vim && git submodule update --init && cd -
	cd $(REPO_PATH)gnome-terminal-colors-solarized && ./set_dark.sh && cd -
	cd ~/.vim/bundle/YouCompleteMe/ && ./install.sh && cd -
	wget https://gist.github.com/ticosax/6437234/raw/0ee0e1b01534921a3a6f181100f8326127325a19/git_svn_bash_prompt.sh -O ~/.git_svn_bash_prompt
	echo ". ~/.git_svn_bash_prompt" | tee -a ~/.bashrc

clean:
	rm -rf $(REPO_PATH)powerline-fonts ~/.fonts
	fc-cache -v
	gconftool --set /apps/gnome-terminal/profiles/Default/font --type=string "DejaVu Sans Mono"
	gconftool --set /apps/gnome-terminal/profiles/Default/use_system_font --type=bool "true"
