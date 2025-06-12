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
fi
brew install git;
which -s gh
if [ "X$?" = "X1" ];
then
  brew install gh;
  gh auth login;
fi
mkdir -p /opt;
cd /opt;
# Removed if already there.
rm -rf /opt/MacScripts;
git clone git@github.com:albaropereyra22/MacScripts.git;
mkdir -p ~/bin;
cp /opt/MacScripts/MacDevEnv.sh ~/bin/;
chmod u+x ~/bin/MacDevEnv.sh;
sh ~/bin/MacDevEnv.sh;
