{
  pkgs,
  config,
  user,
  hostname,
  ...
}: {
  imports = [
    ../../modules/users/andrian
  ];

  system.configurationRevision = config.rev or null;
  system.stateVersion = 6;

  nix.enable = false; # Determinate Systems daemon handles it

  determinateNix = {
    enable = true;
    customSettings = {
      lazy-trees = true;
      cores = 0;
      trusted-users = [
        "root"
        "@admin"
      ];
    };
    determinateNixd.garbageCollector.strategy = "automatic";
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  nixpkgs.config.allowUnfree = true;

  networking = {
    hostName = "${hostname}";
    computerName = "${hostname}";
    localHostName = "${hostname}";
  };

  environment.variables = {
    LANG = "en_US.UTF-8";
  };

  environment.shells = [pkgs.fish];
  programs.fish.enable = true;

  users.users.${user} = {
    home = "/Users/${user}";
    shell = pkgs.fish;
  };

  system.primaryUser = "${user}";

  environment.systemPackages = with pkgs; [
    alejandra
    bat
    btop
    claude-code
    cowsay
    dfc
    fastfetch
    ffmpeg
    figlet
    flock
    fortune
    furnace
    fzf
    ghostscript
    go
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
      "ghostty"
      "gimp"
      "google-drive"
      "inkscape"
      "ioquake3"
      "keepassxc"
      "keepingyouawake"
      "keka"
      "lm-studio"
      "obsidian"
      "openemu"
      "openmw"
      "orbstack"
      "sonic-pi"
      "spotify"
      # "stremio"
      "transmission"
      "utm"
      "vlc"
      "wireshark-app"
      "zed"
    ];
  };

  environment.systemPath = [
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
    "/Users/${user}/.lmstudio/bin"
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
      "/Applications/Ghostty.app"
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

  system.defaults.NSGlobalDomain = {
    AppleIconAppearanceTheme = "TintedAutomatic";
    NSAutomaticCapitalizationEnabled = false;
    NSAutomaticDashSubstitutionEnabled = false;
    NSTableViewDefaultSizeMode = 2;
  };
}
