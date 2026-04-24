#!/bin/bash

Repository="https://github.com/kiweezi/nix"
Ref="init"
Host="vm"

cd ~
mkdir -p nixos/flake

# Clone the flake repository. This assumes git is already installed.
cd nixos/flake
git clone $Repository .

# Switch to the specified ref, then nix switch.
git checkout $Ref
git pull origin $Ref
nixos-rebuild switch --flake .#${Host}

# Then I need to run this command to init the bootstrap on a nixos system:
# nix-shell -p git --command "nix run --experimental-features 'nix-command flakes' github:kiweezi/nix?ref=init"
