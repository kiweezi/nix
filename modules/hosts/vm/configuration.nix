# VirtualBox VM device configuration for NixOS.

{ self, inputs, ... }: {
    flake.nixosModules.vmConfiguration = { pkgs, lib, ... }: {
        imports = [
            self.nixosModules.vmHardware
            self.nixosModules.locales.europeAmsterdam
            self.nixosModules.configs.common
        ];

        # Always enable flakes.
        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        networking = {
            hostName = "vm";
            useDHCP = true;
        };
    };
}