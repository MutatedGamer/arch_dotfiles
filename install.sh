#install yay
git clone https://aur.archlinux.org/yay.git
cd yay || exit
makepkg -si
cd ..

# Update system
pacman -Syu

# Install packages 
sudo pacman -S --needed - < pkglist.txt
yay -S $(cat aurpkgs.txt)

# Remove old files
mv ~/.config ~/config.old
mv ~/.bash ~/bash.old
mv ~/.bashrc ~/bashrc.old
mv ~/.compton.conf ~/compton.conf.old
mv ~/.vimrc ~/vimrc.old
mv ~/.vim ~/vim.old
mv ~/.Xauthority ~/Xauthority.old
mv ~/.xinitrc xinitrc.old

# Copy new files
cp -r .config ~
cp -r .bash ~
cp -r .wallpapers ~
cp .bashrc ~
cp .compton.conf ~
cp .vimrc ~
cp .Xauthority ~
cp .xinitrc ~
cp .profile ~
cp -r .vim ~
cp -r .scripts ~

# Copy cups and lightdm settings
sudo mv /etc/cups /etc/cups.old
tar -vxf etc/cups.tar.gz 
sudo cp -r etc/cups /etc/cups

sudo cp etc/lightdm/lightdm-webkit2-greeter.conf /etc/lightdm/
sudo cp etc/lightdm/lightdm.conf /etc/lightdm

sudo cp .wallpapers/bg.jpg /usr/share/lightdm-webkit/themes/lightdm-webkit-theme-aether/src/img/wallpapers/space-1.jpg 

# Copy Equilix theme
sudo cp -r Equilix /usr/share/themes/

# Install Vundle plugins
vim +PluginInstall +qall

# Set up YouCompleteMe
~/.vim/bundle/YouCompleteMe/install.sh --clang-completer

# Enable services
sudo systemctl enable orgs.cups.cupsd.path
sudo systemctl enable lightdm.service
sudo systemctl enable orgs.cups.cupsd.service
sudo systemctl enable systemd-timesyncd.service
sudo systemctl enable org.cups.cupsd.socket

# Install powerline fonts
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
