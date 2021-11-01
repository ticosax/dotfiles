REPO_PATH=~/src

$(REPO_PATH)/terraform-lsp/terraform-lsp:
	git clone git@github.com:juliosueiras/terraform-lsp.git $@
	cd $@ && go build

~/.zshrc:
	ln -fs $(REPO_PATH)/dotfiles/zshrc $@

.PHONY: install
install: pre-install $(REPO_PATH)/terrcform-lsp/terraform-lsp ~/.zshrc
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
	sudo pacman -S --needed oh-my-zsh ruby terraform neovim powerline-fonts go github-cli gitg
	nvim +PlugInstall
	git config --global core.excludesfile ~/.gitignore_global
