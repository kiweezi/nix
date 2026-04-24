{ inputs, self, ... }: {
  
  # flake.nixosConfigurations.vm = inputs.nixpkgs.lib.nixosSystem {
  #   modules = [
  #     self.nixosModules.vmHardware
  #   ];
  # };

  flake.nixosConfigurations.vmConfiguration = { pkgs, ... }: {
    imports = [
      self.nixosModules.vmHardware
      self.nixosModules.locales.europeAmsterdam
      # self.nixosModules.configs.common
    ];

    # Always enable flakes.
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    networking = {
      hostName = "vm";
      useDHCP = true;
    };
  };
}