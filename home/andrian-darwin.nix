{pkgs, ...}: {
  imports = [
    ./common.nix
  ];

  home.stateVersion = "25.05";

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    controlMaster = "auto";
    includes = ["~/.ssh/config.d/*"];
  };

  programs.gpg.enable = true;

  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_greeting ""
    '';
    shellAliases = {
      rebuild = "sudo darwin-rebuild switch --flake ~/nix-config";
    };
  };
}
