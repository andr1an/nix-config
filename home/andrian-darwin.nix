{
  imports = [
    ../modules/home-common.nix
  ];

  home.stateVersion = "25.05";

  programs.gpg.enable = true;

  programs.fish = {
    shellAliases = {
      rebuild = "sudo darwin-rebuild switch --flake ~/nix-config";
    };
  };

  home.file."ghostty" = {
    target = ".config/ghostty/config";
    source = ../config/ghostty;
  };
}
