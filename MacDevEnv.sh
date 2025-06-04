#! /bin/sh -

# set local
#sudo locale-gen "en_US.UTF-8"
#sudo dpkg-reconfigure locales
brew install zsh emacs screen;
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd;
rm -rf ~/zshconf;
git clone git@github.com:AlbaroPereyra22/zshconf.git
chmod u+x ~/zshconf/installer.sh
cd zshconf
./installer.sh
cd;
rm -rf ~/emacsconf;
git clone git@github.com:AlbaroPereyra22/emacsconf.git
chmod u+x ~/emacsconf/installer.sh
cd emacsconf
./installer.sh
git clone git@github.com:AlbaroPereyra/screenconf.git
mv screenconf/.screenrc ~
