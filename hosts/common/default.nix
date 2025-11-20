{pkgs, ...}: {
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  boot.tmp.cleanOnBoot = true;

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_DK.UTF-8";
  };

  environment.systemPackages = with pkgs; [
    # System
    p7zip
    pbzip2
    pigz
    xz
    unrar
    unzip
    git
    mkpasswd

    # Monitors
    btop
    iotop
    iptraf-ng
    htop
    lsof
    ncdu
    dfc

    # Hack
    nmap
    dnsutils
    inetutils
    socat
    mtr

    # Command line
    bat
    curl
    wget
    jq
    yq-go
    tree
    pv
    file
    rsync
    tmux
  ];

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };

  programs.vim = {
    enable = true;
    defaultEditor = true;
  };
}
