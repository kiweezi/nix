{
  description = "Bootstrap configuration for NixOS using git";

  inputs = { ... };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};

      # Systems that can run tests:
      supportedSystems = [ "aarch64-linux" "i686-linux" "x86_64-linux" ];

      # Function to generate a set based on supported systems:
      forAllSystems = inputs.nixpkgs.lib.genAttrs supportedSystems;

      # Attribute set of nixpkgs for each system:
      nixpkgsFor =
        forAllSystems (system: import inputs.nixpkgs { inherit system; });
   in {
     packages = forAllSystems (system:
        let pkgs = nixpkgsFor.${system};
        in {
          default = self.packages.${system}.bootstrap;

          bootstrap = pkgs.writeShellApplication {
            name = "bootstrap";
            runtimeInputs = with pkgs; [ git ]; # deps
            text = ''${./bootstrap.sh} "$@"''; # the script
          };
        });

     apps = forAllSystems (system: {
       default = self.apps.${system}.bootstrap;

       bootstrap = {
         type = "app";
         program = "${self.packages.${system}.bootstrap}/bin/bootstrap";
       };
     });
   };
}