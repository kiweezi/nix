{ self, inputs, ... }: {
    flake.nixosModules.configs.common = { pkgs, lib, ... }: {
        imports = [
            self.nixosModules.features.niri
        ];

        networking.networkmanager.enable = true;

        programs = {
            # Gaming.
            steam = {
                enable = true;
                remotePlay.openFirewall = true;
                localNetworkGameTransfers.openFirewall = true;
            };

            # Development.
            vscode = {
                enable = true;
                extensions = with pkgs.vscode-extensions; [
                    ms-vscode-remote.remote-containers
                    vscode-icons-team.vscode-icons
                ];
            };
            fish = {
                enable = true;
                shellAliases = [];
            };
            git = {
                enable = true;
                userName = "kiweezi";
                userEmail = "46600706+kiweezi@users.noreply.github.com";
                config = {
                    init = {
                        defaultBranch = "main";
                    };
                    safe = {
                        directory = [
                            "/etc/nixos"
                            "/home/kiweezi/.dotfiles"
                        ];
                    };
                };
            };
        };

        # Non-open software.
        nixpkgs.config = { 
            allowUnfree = true; 
        };
        environment.systemPackages = with pkgs; [
            discord
            obsidian
            vlc
            qbittorrent
            spotify
            gimp
            prismlauncher
        ];
    };
}