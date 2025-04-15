curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

echo "export PATH=\"$PATH:/opt/nvim-linux-x86_64/bin\"" >>~/.bashrc

rm -rf ~/dotfiles
git clone -b pro https://github.com/Wargast/dotfiles.git ~/dotfiles
cd ~/.config/
rm -rf nvim
ln -sf ~/dotfiles/nvim nvim
