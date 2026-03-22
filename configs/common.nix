{ config, lib, pkgs, ... }:

{
    imports = [];

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
            shellAliases = [
                dirsize = "du -sh"
            ];
        };
        git = {
            enable = true;
            config = {
                global = {
                    userName = "kiweezi";
                    userEmail = "46600706+kiweezi@users.noreply.github.com";
                };
            };
        };
    };
}


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