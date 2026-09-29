UNAME_OS := $(shell lsb_release -si)
REPO_PATH=~/src

~/.typos.toml:
	ln -s $(REPO_PATH)/typos.toml $@

.PHONY: install
install: pre-install ~/.zshrc
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



~/.gitignore_global:
	ln -s `pwd`/gitignore_global $@

~/src/mellow.nvim:
	git clone git@github.com:kvrohit/mellow.nvim.git ~/src/mellow.nvim

~/.config/starship.toml:
	ln -s `pwd`/starship.toml $@

.PHONY: pre-install
pre-install: ~/.bash_aliases ~/.gitignore_global ~/.config/starship.toml ~/.typos.toml
	sudo pacman -Syu \
		zsh \
		terraform \
		neovim \
		go \
		github-cli \
		gitg \
		gcc \
		zig \
		ripgrep \
		docker \
		docker-compose \
		thunderbird \
		direnv \
		bat \
		gitui \
		ttf-fira-code \
		prettier \
		shellcheck \
		starship \
		sqlfluff \
		gnome-browser-connector \
		rustup \
		difftastic \
		bat \
		wl-clipboard \
		jenv \
		uv \
		cargo-edit \
		ruff 
	yay code-minimap taplo krew # coursier metals

	git config --global core.excludesfile ~/.gitignore_global

# Conveniant services to activate
# systemctl --user enable gcr-ssh-agent.service
# systemctl --user enable ssh-agent.service
