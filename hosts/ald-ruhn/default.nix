{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../common/users/andrian
  ];

  system.configurationRevision = config.rev or null;
  system.stateVersion = 6;

  nix = {
    enable = false; # Determinate Systems daemon handles it
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  networking = {
    hostName = "ald-ruhn";
    computerName = "ald-ruhn";
    localHostName = "ald-ruhn";
  };

  environment.variables = {
    LANG = "en_US.UTF-8";
  };

  environment.shells = [pkgs.fish];
  programs.fish.enable = true;

  users.users.andrian = {
    home = "/Users/andrian";
    shell = pkgs.fish;
  };

  system.primaryUser = "andrian";

  environment.systemPackages = with pkgs; [
    alejandra
    bat
    btop
    cowsay
    fastfetch
    ffmpeg
    figlet
    flock
    fortune
    furnace
    fzf
    ghostscript
    htop
    imagemagick
    jq
    lftp
    mtr
    ncdu
    nil
    nixd
    nmap
    python3
    shellcheck
    socat
    tmux
    tree
    vim
    watch
    yq-go
    yt-dlp
  ];

  fonts.packages = with pkgs; [
    fantasque-sans-mono
    paratype-pt-mono
    paratype-pt-sans
    paratype-pt-serif
  ];

  homebrew = {
    enable = true;
    taps = builtins.attrNames config.nix-homebrew.taps;
    casks = [
      "audacity"
      "blender"
      "chatgpt"
      "gimp"
      "google-drive"
      "inkscape"
      "ioquake3"
      "iterm2"
      "keepassxc"
      "keepingyouawake"
      "keka"
      "obsidian"
      "openemu"
      "openmw"
      "spotify"
      "stremio"
      "transmission"
      "utm"
      "wireshark-app"
      "zed"
    ];
  };

  environment.systemPath = [
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
  ];

  system.defaults.dock = {
    magnification = true;
    show-recents = false;
    tilesize = 54;
    largesize = 64;
    persistent-apps = [
      "/System/Applications/Apps.app"
      "/System/Applications/Calendar.app"
      "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app"
      "/System/Applications/Mail.app"
      "/Applications/iTerm.app"
      "/Applications/Zed.app"
      "/Applications/Obsidian.app"
      "/Applications/ChatGPT.app"
      "/Applications/Spotify.app"
      "/System/Applications/System Settings.app"
    ];
  };

  system.defaults.finder = {
    ShowPathbar = true;
    FXPreferredViewStyle = "Nlsv";
    FXRemoveOldTrashItems = true;
  };
}
