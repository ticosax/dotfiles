REPO_PATH=~/src

.PHONY: install
install: pre-install ~/.oh-my-zsh ~/.zshrc life-saver /lib/udev/rules.d/78-mm-whitelist-internal-modem.rules
	# - crontab -l | grep ctags;\
	# 	status=$$?; \
	# 	if [ $$status = 1 ]; then \
	#     echo "no match" && crontab -l > /tmp/tmpcrontab; \
	# 	echo "1 * * * * ctags -R -o ~/.mytags ~/src" >> /tmp/tmpcrontab; \
	#     crontab /tmp/tmpcrontab; \
	# 	fi
	cd $(REPO_PATH)/gnome-terminal-colors-solarized && ./set_dark.sh && cd -
	echo "Done"

$(REPO_PATH)/powerline-fonts:
	git clone https://github.com/Lokaltog/powerline-fonts.git $@

~/.local/share/nvim/site/autoload/plug.vim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim<Paste>

$(REPO_PATH)/gnome-terminal-colors-solarized:
	# Solarized for terminal
	git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git $@

~/.ctags:
	ln -s `pwd`/ctags $@

~/.bash_aliases:
	ln -s `pwd`/bash_aliases $@

.PHONY: delete-vimrc
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

.PHONY: pre-install
pre-install: $(REPO_PATH)/powerline-fonts ~/.local/share/nvim/site/autoload/plug.vim $(REPO_PATH)/gnome-terminal-colors-solarized ~/.ctags ~/.bash_aliases ~/.vimrc ~/.ackrc ~/.gitignore_global ~/.screenrc ~/.tmux.conf
	sudo add-apt-repository ppa:neovim-ppa/stable -y
	sudo add-apt-repository ppa:longsleep/golang-backports -y
	sudo apt update
	sudo apt install -y neovim exuberant-ctags python-fontforge cmake python-dev python3-dev python3-pip zsh build-essential ack-grep libffi-dev direnv golang-go
	sudo snap install hub --classic
	mkdir -p ~/.fonts/
	find ../powerline-fonts -name '*.?tf' -exec cp {} -t $$HOME/.fonts/ \;
	fc-cache -vf ~/.fonts
	curl https://bootstrap.pypa.io/get-pip.py | python3 - --user
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
	sudo cp $(pwd)/70-u2f.rules $@
	sudo udevadm control --reload-rules
	sudo udevadm trigger

/lib/udev/rules.d/78-mm-whitelist-internal-modem.rules:
	sudo cp 78-mm-whitelist-internal-modem.rules $@
	sudo chmod 0644 $@

.PHONY: life-saver
life-saver:
	gsettings set org.gnome.desktop.media-handling automount-open false

.PHONY: clean
clean:
	rm -rf $(REPO_PATH)/powerline-fonts ~/.fonts
	fc-cache -v
	gconftool --set /apps/gnome-terminal/profiles/Default/font --type=string "DejaVu Sans Mono"
	gconftool --set /apps/gnome-terminal/profiles/Default/use_system_font --type=bool "true"
	gsettings set org.gnome.desktop.media-handling automount-open true
