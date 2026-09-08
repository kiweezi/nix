{ self, inputs, ... }: {
    flake.nixosModules.vmHardware = { config, lib, pkgs, modulesPath, ... }: {
        imports = [
            (modulesPath + "/installer/scan/not-detected.nix")
            self.nixosModules.drivers.nvidiaTuring
        ];

        boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" ];

        fileSystems."/" = {
            device = "/dev/disk/by-uuid/c41f4c26-cfa8-4253-a815-904f16ea50f0"; # UUID may need changing.
            fsType = "ext4";
        };

        networking.useDHCP = lib.mkDefault true;

        nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

        # Enable VirtualBox Guest Additions for better performance and integration with the host system.
        virtualisation.virtualbox.guest.enable = true;
    };
}