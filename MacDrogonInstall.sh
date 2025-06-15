#! /bin/sh -

brew update;
brew upgrade;
#sudo mysql_secure_installation;
cd /opt;
git clone git@github.com:albaropereyra22/createDrogonProject.git;
cd createDrogonProject;
chmod u+x createDrogonProject.sh;
./createDrogonProject.sh -n firstProject;
dg_ctl -v;

