#!/bin/bash
read -p "Enter source path: " sourcePath
read -p "Enter destination path: " destPath
ln -s "$PWD/config" "$HOME/.config/nvim"
