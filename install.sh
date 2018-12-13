# install yay
git clone https://aur.archlinux.org/yay.git
cd yay || exit
makepkg -si
cd ..

# Install packages 
pacman -S --needed - < pkglist.txt
yay -S $(cat aurpkgs.txt)

# Remove old files
mv ~/.config ~/config.old
mv ~/.bash ~/bash.old
mv ~/.bashrc ~/bashrc.old
mv ~/.compton.conf ~/compton.conf.old
mv ~/.vimrc ~/vimrc.old
mv ~/.vim ~/vim.old
mv ~/.Xauthority Xauthority.old
mv ~/.xinitrc xinitrc.old

# Copy new files
mv .config ~/
mv .bash ~/
mv .bashrc ~/
mv .compton.conf ~/
mv .vimrc ~/
mv .Xauthority ~/
mv .xinitrc ~/
mv .vim ~/

# Copy cups and lightdm settings
sudo mv /etc/cups /etc/cups.old
tar -vxf etc/cups.tar.gz 
sudo mv etc/cups /etc/cups

sudo mv etc/lightdm/lightdm-webkit2-greeter.conf /etc/lightdm/
sudo mv etc/lightdm/lightdm.conf /etc/lightdm

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
