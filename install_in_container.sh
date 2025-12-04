cd /tmp
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz

echo "export PATH=\$PATH:/opt/nvim-linux-x86_64/bin" >>~/.bashrc

sudo apt update
sudo apt install -y fzf ripgrep fd-find python3.10-venv bat

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

rm -rf ~/dotfiles
git clone -b pro --depth 1 https://github.com/Wargast/dotfiles.git ~/dotfiles
cd ~/.config/
rm -rf nvim
ln -sf ~/dotfiles/nvim nvim
cp ~/dotfiles/.bash_aliases ~

echo "export EDITOR=nvim" >>~/.bashrc
