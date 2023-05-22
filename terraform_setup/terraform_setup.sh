cd ~
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
mkdir -p ~/.local/bin/
sudo ln -s ~/.tfenv/bin/* ~/.local/bin/
tfenv install 1.4.6
tfenv use 1.4.6

terraform -version
