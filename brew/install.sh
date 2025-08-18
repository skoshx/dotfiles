#!/bin/zsh

function install_casks {
  local casks_file="./casks"
  while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -z "$line" || "$line" == \#* ]] && continue  # Skip empty lines and comments
    brew install --cask "$line"
  done < "$casks_file"
}

function install_leaves {
  local leaves_file="./leaves"
  while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -z "$line" || "$line" == \#* ]] && continue  # Skip empty lines and comments
    brew install "$line"
  done < "$leaves_file"
}

echo "installing programs with brew"
install_casks
install_leaves

