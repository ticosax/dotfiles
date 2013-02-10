install:
	sudo apt-get install vim exuberant-ctags python-fontforge
	rm -f ~/.vimrc
	ln -s `pwd`/vimrc ~/.vimrc
	test -d ../powerline-fonts || git clone https://github.com/Lokaltog/powerline-fonts.git ../powerline-fonts
	mkdir -p ~/.fonts/
	find ../powerline-fonts -name '*.otf' -exec cp {} -t $$HOME/.fonts/ \;
	fc-cache -vf ~/.fonts
	gconftool --set /apps/gnome-terminal/profiles/Default/font --type=string "Source Code Pro for Powerline Light 12"
	vim +BundleInstall +qall

	cd ~/.vim/bundle/jedi-vim && git submodule update --init
	cd -

clean:
	rm -rf ../powerline-fonts ~/.fonts
	fc-cache -v
	gconftool --set /apps/gnome-terminal/profiles/Default/font --type=string "DejaVu Sans Mono"

update:
	cd ../powerline-fonts && git pull origin master
	cd -
	find ../powerline-fonts -name '*.otf' -exec cp {} -t $$HOME/.fonts/ \;
	fc-cache -vf ~/.fonts

