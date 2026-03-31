#!/bin/bash

Repository="https://github.com/kiweezi/nix"
Host="vm"

cd ~
mkdir -p nixos/flake

# Clone the flake repository. This assumes git is already installed.
cd nixos/flake
git clone $Repository .

# Switch to the latest commit on the main branch, then nix switch.
git checkout main
git pull origin main
nixos-rebuild switch --flake .#${Host}
