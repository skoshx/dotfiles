#!/bin/zsh

function install_casks {
  local casks_file="./brew/casks"
  while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -z "$line" || "$line" == \#* ]] && continue  # Skip empty lines and comments
    echo "installing: $line"
    if ! brew install --cask "$line"; then
      echo "failed to install: $line"
    fi
  done < "$casks_file"
}

function install_leaves {
  local leaves_file="./brew/leaves"
  while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -z "$line" || "$line" == \#* ]] && continue  # Skip empty lines and comments
    echo "installing: $line"
    if ! brew install "$line"; then
      echo "failed to install: $line"
    fi
  done < "$leaves_file"
}

echo "installing programs with brew"
install_casks
install_leaves
