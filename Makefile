install:
	sudo apt-get install vim exuberant-ctags python-fontforge
	rm -f ~/.vimrc
	ln -s `pwd`/vimrc ~/.vimrc
	test -d ../powerline-fonts || git clone https://github.com/Lokaltog/powerline-fonts.git ../powerline-fonts
	mkdir -p ~/.fonts/
	cp ../powerline-fonts/Menlo/Menlo\ Regular\ for\ Powerline.otf ~/.fonts/
	fc-cache -vf ~/.fonts
	# TODO automatize this
	echo 'Configure your terminal with this font'
	vim +BundleInstall +qall

	cd ~/.vim/bundle/jedi-vim && git submodule update --init
	cd -

clean:
	rm -rf ../powerline-fonts ~/.fonts
	fc-cache -v

