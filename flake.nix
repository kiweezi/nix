{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
  };

  # outputs = inputs:
  #   inputs.flake-parts.lib.mkFlake {inherit inputs;}
  #     (inputs.import-tree ./modules);

  outputs = inputs @ { flake-parts, import-tree, ... }:
    flake-parts.lib.mkFlake {inherit inputs;}
      (import-tree ./modules);
}
