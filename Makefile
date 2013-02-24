install:
	# Vim stuff
	sudo apt-get install vim vim-gnome exuberant-ctags python-fontforge
	rm -f ~/.vimrc
	ln -s `pwd`/vimrc ~/.vimrc
	test -d ../powerline-fonts || git clone https://github.com/Lokaltog/powerline-fonts.git ../powerline-fonts
	mkdir -p ~/.fonts/
	find ../powerline-fonts -name '*.otf' -exec cp {} -t $$HOME/.fonts/ \;
	fc-cache -vf ~/.fonts
	gconftool --set /apps/gnome-terminal/profiles/Default/font --type=string "Source Code Pro for Powerline Light 12"
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	vim +BundleInstall +qall
	cd ~/.vim/bundle/jedi-vim && git submodule update --init
	cd -
	# Solarized for terminal
	git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git ~/src/gnome-terminal-colors-solarized
	cd ~/src/gnome-terminal-colors-solarized && ./set_dark.sh && cd -

clean:
	rm -rf ../powerline-fonts ~/.fonts
	fc-cache -v
	gconftool --set /apps/gnome-terminal/profiles/Default/font --type=string "DejaVu Sans Mono"

update:
	cd ../powerline-fonts && git pull origin master
	cd -
	find ../powerline-fonts -name '*.otf' -exec cp {} -t $$HOME/.fonts/ \;
	fc-cache -vf ~/.fonts

