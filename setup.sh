echo "installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> $HOME/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "installing brew casks and leaves"
zsh brew/install.sh

echo "moving zsh config"
cp .zshrc $HOME/.zshrc
source $HOME/.zshrc

echo "setting node@20 as default for nvm"
nvm install 20

echo "enabling corepack"
corepack enable

echo "setting up git"
cp .gitconfig $HOME/.gitconfig

cat > ~/.ssh/config <<EOL
Host github.com
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_ed25519
  IdentitiesOnly yes
EOL

echo "place the private key in ~/.ssh/id_ed25519"

echo "todo: add vscode config"

echo "installing rust"
curl https://sh.rustup.rs -sSf | sh


echo "setup settings: keyboard -> input sources -> edit -> disable autocomplets "

