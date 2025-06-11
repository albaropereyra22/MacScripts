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
which brew;
if [ "X1" = "X$?" ];
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
fi
brew install git;
brew install gh;
gh auth login;
mkdir -p /opt;
cd /opt;
# Removed if already there.
rm -rf /opt/MacScripts;
git clone git@github.com:albaropereyra22/MacScripts.git;
mkdir -p ~/bin;
cp /opt/MacScripts/MacDevEnv.sh ~/bin/;
chmod u+x ~/bin/MacDevEnv.sh;
sh ~/bin/MacDevEnv.sh;
