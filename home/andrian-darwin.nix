{pkgs, ...}: {
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    controlMaster = "auto";
    includes = ["~/.ssh/config.d/*"];
  };

  programs.gpg.enable = true;

  programs.vim = {
    enable = true;
    defaultEditor = true;
    settings = {
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
      mouse = "a";
    };
  };

  programs.git = {
    enable = true;
    userName = "andr1an";
    userEmail = "info@andrian.ninja";
    aliases = {
      st = "status";
      co = "checkout";
      br = "branch";
      ci = "commit";
    };
    lfs.enable = true;
    extraConfig = {
      push.default = "simple";
      pull.rebase = true;
      init.defaultBranch = "master";
    };
  };

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
