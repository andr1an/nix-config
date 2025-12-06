{
  pkgs,
  lib,
  osConfig,
  ...
}: {
  imports = [
    ../modules/home-common.nix
    ../modules/xfconf.nix
  ];

  home.stateVersion = "25.05";

  programs.fish = {
    shellAliases = {
      pbcopy = "xclip -selection clipboard";
      pbpaste = "xclip -selection clipboard -o";
      rebuild = "sudo nixos-rebuild switch --flake ~/nix-config";
      nixos-list-generations = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      gdrive-bisync = "rclone bisync -v gdrive: ~/\"Google Drive\"";
    };
  };

  home.file."touchegg" = {
    target = ".config/touchegg/touchegg.conf";
    source = ../config/touchegg.conf;
  };

  home.file."skippy-xd" = lib.mkIf (osConfig.services.xserver.desktopManager.xfce.enable or false) {
    target = ".config/skippy-xd/skippy-xd.rc";
    source = ../config/skippy-xd.rc;
  };

  home.file."docklike" = lib.mkIf (osConfig.services.xserver.desktopManager.xfce.enable or false) {
    target = ".config/xfce4/panel/docklike-7.rc";
    source = ../config/docklike-7.rc;
  };

  systemd.user.services.skippy-xd = {
    Unit = {
      Description = "Full-screen task-switcher for X11";
      After = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.skippy-xd}/bin/skippy-xd --start-daemon";
      ExecReload = "${pkgs.skippy-xd}/bin/skippy-xd --config-reload";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };

  xdg.configFile."alacritty/alacritty.toml".source = ../config/alacritty.toml;
}
