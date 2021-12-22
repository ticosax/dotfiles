REPO_PATH=~/src

~/.zshrc:
	ln -fs $(REPO_PATH)/dotfiles/zshrc $@

.PHONY: install
install: pre-install ~/.zshrc
	echo "Done"


~/.local/share/nvim/site/autoload/plug.vim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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
pre-install: ~/.local/share/nvim/site/autoload/plug.vim ~/.bash_aliases ~/.vimrc ~/.ackrc ~/.gitignore_global ~/.screenrc ~/.tmux.conf
	sudo pamac install zsh oh-my-zsh ruby terraform neovim powerline-fonts go github-cli gitg gcc zig ripgrep docker docker-compose krew antigen pyenv thunderbird direnv pyenv-virtualenv bat
	nvim +PlugInstall
	git config --global core.excludesfile ~/.gitignore_global
