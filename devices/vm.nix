# VirtualBox VM device configuration for NixOS.

{ config, lib, pkgs, modulesPath, ... }:

{
    imports = [
        "${modulesPath}/devices/common/nvidia-turing.nix"
        "${modulesPath}/configs/common.nix"
        "${modulesPath}/modules/europe-locale.nix"
    ];

    networking = {
        hostName = "vm";
        useDHCP = true;
    };
    
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

    # Enable VirtualBox Guest Additions for better performance and integration with the host system.
    virtualisation.virtualbox.guest.enable = true;
}