REPO_PATH=~/src/

install: pre-install ~/.vim/bundle/YouCompleteMe/python ~/.vim/bundle/Command-T/ruby/command-t/ext.so ~/.git_svn_bash_prompt
	- crontab -l | grep ctags;\
		status=$$?; \
		if [ $$status = 1 ]; then \
	    echo "no match" && crontab -l > /tmp/tmpcrontab; \
		echo "1 * * * * ctags -R -o ~/.mytags ~/src" >> /tmp/tmpcrontab; \
	    crontab /tmp/tmpcrontab; \
		fi
	cd $(REPO_PATH)gnome-terminal-colors-solarized && ./set_dark.sh && cd -
	echo "Done"

~/.git_svn_bash_prompt:
	wget https://gist.github.com/ticosax/6437234/raw/0ee0e1b01534921a3a6f181100f8326127325a19/git_svn_bash_prompt.sh -O ~/.git_svn_bash_prompt

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

delete-vimrc:
	rm -f ~/.vimrc

~/.vimrc: delete-vimrc

	ln -s `pwd`/vimrc ~/.vimrc

~/.ackrc:
	ln -s `pwd`/ackrc ~/.ackrc

~/.screenrc:
	ln -s `pwd`/screenrc ~/.screenrc

~/.gitignore_global:
	ln -s `pwd`/gitignore_global ~/.gitignore_global

pre-install: $(REPO_PATH)powerline-fonts ~/.vim/bundle/vundle $(REPO_PATH)gnome-terminal-colors-solarized ~/.ctags ~/.bash_aliases ~/.vimrc ~/.ackrc ~/.gitignore_global ~/.screenrc
	sudo apt-get install vim vim-gnome exuberant-ctags python-fontforge cmake python-dev ruby ruby-dev
	mkdir -p ~/.fonts/
	find ../powerline-fonts -name '*.otf' -exec cp {} -t $$HOME/.fonts/ \;
	fc-cache -vf ~/.fonts
	gconftool --set /apps/gnome-terminal/profiles/Default/font --type=string "Source Code Pro for Powerline Light 12"
	gconftool --set /apps/gnome-terminal/profiles/Default/use_system_font --type=bool "false"
	vim +BundleInstall +qall
	git config --global core.excludesfile ~/.gitignore_global

~/.vim/bundle/YouCompleteMe/python:
	cd ~/.vim/bundle/YouCompleteMe/ && ./install.sh && cd -

~/.vim/bundle/Command-T/ruby/command-t/ext.so:
	cd ~/.vim/bundle/Command-T/ruby/command-t && ruby extconf.rb && make && cd -

clean:
	rm -rf $(REPO_PATH)powerline-fonts ~/.fonts
	fc-cache -v
	gconftool --set /apps/gnome-terminal/profiles/Default/font --type=string "DejaVu Sans Mono"
	gconftool --set /apps/gnome-terminal/profiles/Default/use_system_font --type=bool "true"
