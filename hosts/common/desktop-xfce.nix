{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    xfce.xfce4-xkb-plugin
    xfce.xfce4-sensors-plugin
    xfce.xfce4-docklike-plugin
    xclip
    xarchiver
    alacritty
    tela-icon-theme
    evince
  ];

  services.xserver = {
    enable = true;
    desktopManager.xfce.enable = true;
    displayManager.lightdm.enable = true;
    displayManager.lightdm.greeters.gtk = {
      enable = true;
      iconTheme.package = pkgs.tela-icon-theme;
      iconTheme.name = "Tela";
      extraConfig = ''
        background = ${pkgs.nixos-artwork.wallpapers.stripes-logo.gnomeFilePath}
        font-name = PT Sans 11
        indicators = ~host;~spacer;~clock;~spacer;~session;~language;~a11y;~power
        clock-format = %Y-%m-%d %H:%M:%S
      '';
    };
    enableCtrlAltBackspace = true;
    xkb = {
      layout = "us,ru";
      variant = "";
      options = lib.concatStringsSep "," [
        "grp:caps_toggle"
        "terminate:ctrl_alt_bksp"
      ];
    };
  };

  fonts = {
    packages = with pkgs; [
      fantasque-sans-mono
      paratype-pt-mono
      paratype-pt-sans
      paratype-pt-serif
      corefonts
    ];
    fontconfig.hinting.enable = true;
    fontconfig.subpixel.rgba = "rgb";
  };
}
