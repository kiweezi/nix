{
    description = "NixOS config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        # Frameworks for segmenting configuration into reusable modules.
        flake-parts.url = "github:hercules-ci/flake-parts";
        import-tree.url = "github:vic/import-tree";

        wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    };

    # Load modules and hosts.
    outputs = inputs:
        inputs.flake-parts.lib.mkFlake { inherit inputs; }
            (inputs.import-tree ./modules);
}