sudo apt-get install exuberant-ctags python-fontforge
rm -f ~/.vimrc
ln -s `pwd`/vimrc ~/.vimrc
git clone https://github.com/Lokaltog/powerline-fonts.git ../powerline-fonts
mkdir ~/.fonts/
cp ../powerline-fonts/Menlo/Menlo\ Regular\ for\ Powerline.otf ~/.fonts/
fc-cache -vf ~/.fonts
# TODO automatize this
echo 'Configure your terminal with this font'
