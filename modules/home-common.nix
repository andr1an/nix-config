{
  programs.home-manager.enable = true;

  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_greeting ""
    '';
  };

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
    lfs.enable = true;
    settings = {
      user.name = "andr1an";
      user.email = "info@andrian.ninja";
      push.default = "simple";
      pull.rebase = true;
      init.defaultBranch = "master";
      alias = {
        st = "status";
        co = "checkout";
        br = "branch";
        ci = "commit";
        hist = "log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short";
        type = "cat-file -t";
        dump = "cat-file -p";
      };
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*" = {
      addKeysToAgent = "yes";
      controlMaster = "auto";
    };
    includes = ["~/.ssh/config.d/*"];
  };
}
