#! /bin/sh -


if [ "X$1" = "X-h" ];
then
  tee <<EOF
usage: /bin/sh -c "\$(curl -fsSL https://raw.githubusercontent.com/albaropereyra22/MacScripts/HEAD/installEverything.sh)"
EOF
  exit 0;
fi
# TODO determine Mac
# TODO determine if brew is installed
# TODO determine if git is installed
# TODO ask for root priveleges
which -s brew;
if [ "X$?" = "X1" ];
then
  unset HOMEBREW_BREW_GIT_REMOTE HOMEBREW_CORE_GIT_REMOTE;
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
  echo >> /Users/$(whoami)/.zprofile                                                                           
  echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/$(whoami)/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv zsh)"
  # Update every 24 hours
  export HOMEBREW_AUTO_UPDATE_SECS="86400";
fi

if [ ! -e /opt/homebrew/bin/git ];
then
  brew install git; 
  git config --global user.name "$(id -F)";
  printf "Enter email account (ex. username@gmail.com): ";
  read emailAddress;
  git config --global user.email "emailAddress";
  # set the default conflict resolution.
  git config --global pull.rebase false;
  # set default branch to main since git now complains if it is master.
  defaultBranch=main;
  git config --global init.defaultBranch $defaultBranch;  
fi
which -s gh
if [ "X$?" = "X1" ];
then
  brew install gh;
  gh auth login;
fi
mkdir -p ~/opt;
cd ~/opt;
# Removed if already there.
rm -rf ~/opt/MacScripts;
git clone git@github.com:albaropereyra22/MacScripts.git;
mkdir -p ~/bin;
cp -fr ~/opt/MacScripts/MacDevEnv.sh ~/bin/;
chmod u+x ~/bin/MacDevEnv.sh;
sh ~/bin/MacDevEnv.sh;

cp -fr ~/opt/MacScripts/MacDrogonInstall.sh  ~/bin/;
chmod u+x ~/bin/MacDrogonInstall.sh;
sh ~/bin/MacDrogonInstall.sh;
