REPO_PATH=~/src

~/.zshrc:
	ln -fs $(REPO_PATH)/dotfiles/zshrc $@

~/.config/wezterm/wezterm.lua:
	mkdir -p ~/.config/wezterm
	ln -s $(REPO_PATH)/dotfiles/wezterm.lua $@

.PHONY: install
install: pre-install ~/.zshrc ~/.config/wezterm/wezterm.lua
	echo "Done"


~/.local/share/nvim/site/autoload/plug.vim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

~/.bash_aliases:
	ln -s `pwd`/bash_aliases $@

# .PHONY: delete-vimrc
# delete-vimrc:
# 	mkdir -p ~/.config/nvim
# 	rm -f ~/.config/nvim/init.vim
#
# ~/.vimrc: delete-vimrc
#
# 	ln -s `pwd`/vimrc ~/.config/nvim/init.vim
~/.config/nvim/lua/custom:
	ln -s `pwd`/nvchad/custom $@

~/.ackrc:
	ln -s `pwd`/ackrc $@

~/.screenrc:
	ln -s `pwd`/screenrc $@

~/.tmux.conf:
	ln -s `pwd`/tmux.conf $@

~/.gitignore_global:
	ln -s `pwd`/gitignore_global $@

~/.config/wezterm/wezterm.lua:
	ln -s `pwd`/wezterm.lua $@

.PHONY: pre-install
pre-install: ~/.local/share/nvim/site/autoload/plug.vim ~/.bash_aliases ~/.ackrc ~/.gitignore_global ~/.screenrc ~/.tmux.conf ~/.config/nvim/lua/custom
	sudo pamac install \
		zsh \
		oh-my-zsh \
		ruby \
		terraform \
		neovim \
		powerline-fonts \
		go \
		github-cli \
		gitg \
		gcc \
		zig \
		ripgrep \
		docker \
		docker-compose \
		krew \
		antigen \
		pyenv \
		thunderbird \
		direnv \
		pyenv-virtualenv \
		bat \
		gitui \
		terraform-lsp \
		lua-language-server \
		ttf-fira-code \
		vscode-json-languageserver \
		wezterm \
		mcfly

	nvim +PlugInstall
	git config --global core.excludesfile ~/.gitignore_global
