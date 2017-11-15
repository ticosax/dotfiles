REPO_PATH=~/src

install: pre-install ~/.git_svn_bash_prompt ~/.oh-my-zsh ~/.zshrc
	# - crontab -l | grep ctags;\
	# 	status=$$?; \
	# 	if [ $$status = 1 ]; then \
	#     echo "no match" && crontab -l > /tmp/tmpcrontab; \
	# 	echo "1 * * * * ctags -R -o ~/.mytags ~/src" >> /tmp/tmpcrontab; \
	#     crontab /tmp/tmpcrontab; \
	# 	fi
	cd $(REPO_PATH)/gnome-terminal-colors-solarized && ./set_dark.sh && cd -
	echo "Done"

~/.git_svn_bash_prompt:
	wget https://gist.github.com/ticosax/6437234/raw/0ee0e1b01534921a3a6f181100f8326127325a19/git_svn_bash_prompt.sh -O ~/.git_svn_bash_prompt

$(REPO_PATH)/powerline-fonts:
	git clone https://github.com/Lokaltog/powerline-fonts.git $@

~/.vim/bundle/Vundle.vim:
	git clone https://github.com/gmarik/vundle.git $@

$(REPO_PATH)/gnome-terminal-colors-solarized:
	# Solarized for terminal
	git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git $@

~/.ctags:
	ln -s `pwd`/ctags $@

~/.bash_aliases:
	ln -s `pwd`/bash_aliases $@

delete-vimrc:
	mkdir -p ~/.config/nvim
	rm -f ~/.config/nvim/init.vim

~/.vimrc: delete-vimrc

	ln -s `pwd`/vimrc ~/.config/nvim/init.vim

~/.ackrc:
	ln -s `pwd`/ackrc $@

~/.screenrc:
	ln -s `pwd`/screenrc $@

~/.tmux.conf:
	ln -s `pwd`/tmux.conf $@

~/.gitignore_global:
	ln -s `pwd`/gitignore_global $@

pre-install: $(REPO_PATH)/powerline-fonts ~/.vim/bundle/Vundle.vim $(REPO_PATH)/gnome-terminal-colors-solarized ~/.ctags ~/.bash_aliases ~/.vimrc ~/.ackrc ~/.gitignore_global ~/.screenrc ~/.tmux.conf
	sudo add-apt-repository ppa:neovim-ppa/stable -y
	sudo add-apt-repository ppa:fkrull/deadsnakes -y
	sudo apt-get update
	sudo apt-get install -y neovim exuberant-ctags python-fontforge cmake python-dev python3-dev python3-pip zsh build-essential ack-grep python3.5-dev
	mkdir -p ~/.fonts/
	find ../powerline-fonts -name '*.?tf' -exec cp {} -t $$HOME/.fonts/ \;
	fc-cache -vf ~/.fonts
	gconftool --set /apps/gnome-terminal/profiles/Default/font --type=string "Ubuntu Mono derivative Powerline 10"
	gconftool --set /apps/gnome-terminal/profiles/Default/use_system_font --type=bool "false"
	gconftool --set /apps/gnome-terminal/profiles/Default/custom_command --type=string "/usr/bin/zsh"
	gconftool --set /apps/gnome-terminal/profiles/Default/use_custom_command --type=bool "true"
	curl https://bootstrap.pypa.io/get-pip.py | sudo python3.5 -
	pip2 install --user neovim -U
	pip3 install --user neovim -U
	vim +BundleInstall +qall
	git config --global core.excludesfile ~/.gitignore_global
	sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
	sudo update-alternatives --config vi
	sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
	sudo update-alternatives --config vim
	sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
	sudo update-alternatives --config editor

~/.oh-my-zsh/custom/plugins/zsh-completions:
	git clone https://github.com/zsh-users/zsh-completions $@

~/.oh-my-zsh:
	git clone git://github.com/robbyrussell/oh-my-zsh.git $@

~/.zshrc: ~/.oh-my-zsh ~/.oh-my-zsh/custom/plugins/zsh-completions
	ln -s $(REPO_PATH)/dotfiles/zshrc $@

/etc/udev/rules.d/70-u2f.rules:
	git clone https://github.com/Yubico/libu2f-host ~/src/libu2f-host
	cd ~/src/libu2f-host
	ln -s $(pwd)/70-u2f.rules $@
	udevadm control --reload-rules
	udevadm trigger
clean:
	rm -rf $(REPO_PATH)/powerline-fonts ~/.fonts
	fc-cache -v
	gconftool --set /apps/gnome-terminal/profiles/Default/font --type=string "DejaVu Sans Mono"
	gconftool --set /apps/gnome-terminal/profiles/Default/use_system_font --type=bool "true"
