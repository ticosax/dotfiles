UNAME_OS := $(shell lsb_release -si)
REPO_PATH=~/src

~/.config/wezterm/:
	mkdir -p $@

~/.config/wezterm/wezterm.lua: ~/.config/wezterm/
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


~/.screenrc:
	ln -s `pwd`/screenrc $@

~/.tmux.conf:
	ln -s `pwd`/tmux.conf $@

~/.gitignore_global:
	ln -s `pwd`/gitignore_global $@

~/src/mellow.nvim:
	git clone git@github.com:kvrohit/mellow.nvim.git ~/src/mellow.nvim

~/.config/wezterm/colors/mellow.toml: ~/src/mellow.nvim
	mkdir -p ~/.config/wezterm/colors
	ln -s ~/src/mellow.nvim/extras/wezterm/colors/mellow.toml	 $@

~/.config/starship.toml:
	ln -s `pwd`/starship.toml $@


.PHONY: pre-install
pre-install: ~/.bash_aliases ~/.gitignore_global ~/.screenrc ~/.tmux.conf ~/.config/wezterm/colors/mellow.toml ~/.config/starship.toml
	ifeq ($(UNAME_OS),ManjaroLinux)
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
			pyenv \
			thunderbird \
			direnv \
			pyenv-virtualenv \
			bat \
			gitui \
			ttf-fira-code \
			wezterm \
			mcfly \
			prettier \
			taplo \
			shellcheck \
			starship \
			zplug \
			sqlfluff \
			code-minimap 
	else ($(UNAME_OS),EndeavourOS)
		pacman -Syu 
			zsh \
			ruby \
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
			pyenv \
			thunderbird \
			direnv \
			pyenv-virtualenv \
			bat \
			gitui \
			ttf-fira-code \
			wezterm \
			prettier \
			shellcheck \
			starship \
			sqlfluff \
			gnome-browser-connector \
			rustup \
			difftastic
		yay code-minimap oh-my-zsh taplo krew coursier metals
	endif

	git config --global core.excludesfile ~/.gitignore_global
