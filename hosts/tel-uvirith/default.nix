{
  pkgs,
  unstable,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common

    ../common/users/andrian

    ../common/bluetooth.nix
    ../common/desktop-xfce.nix
    ../common/hardware-host.nix
    ../common/hidpi-retina-mbp133.nix
    ../common/trackpad-mpb.nix
  ];

  system.stateVersion = "25.05";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-fafb9049-d876-47a5-8603-5be5c3c49a84".device = "/dev/disk/by-uuid/fafb9049-d876-47a5-8603-5be5c3c49a84";
  networking.hostName = "tel-uvirith";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Istanbul";

  environment.systemPackages = with pkgs; [
    cowsay
    fortune
    gparted
    libvirt
    qemu_kvm
    rclone
    signify
    virt-manager
  ];

  services.printing.enable = true;
  services.fstrim.enable = true;
  services.mbpfan.enable = true;

  security.sudo.package = pkgs.sudo.override {withInsults = true;};

  programs.gnupg.agent.enable = true;

  programs.ssh = {
    startAgent = true;
    extraConfig = ''
      Host *
        AddKeysToAgent yes
    '';
  };

  virtualisation.libvirtd = {
    enable = true;
    onBoot = "start";
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.redshift = {
    enable = true;
    temperature.night = 5000;
  };

  location = {
    latitude = 41.0;
    longitude = 29.0;
  };

  programs.fish.enable = true;

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  programs.firefox.enable = true;

  users.mutableUsers = false;
  users.users.root.hashedPasswordFile = "/root/.passwd.root";
  users.users.andrian = {
    hashedPasswordFile = "/root/.passwd.andrian";
    description = "Sergey Andrianov";
    extraGroups = ["networkmanager" "wheel" "wireshark" "libvirtd"];
    isNormalUser = true;
    uid = 1000;
    shell = pkgs.fish;
    packages = with pkgs; [
      # Command line
      fzf
      fastfetch
      shellcheck
      taskwarrior3

      # Multimedia
      ffmpeg-full
      yt-dlp
      # stremio
      imagemagick
      inkscape
      gimp3
      vlc
      audacity
      furnace
      mixxx

      # Gaming
      openmw
      fceux

      # System
      keepassxc
      (symlinkJoin {
        name = "pavucontrol-hidpi";
        paths = [pkgs.pavucontrol];
        buildInputs = [makeWrapper];
        postBuild = ''
          wrapProgram $out/bin/pavucontrol \
            --set GDK_SCALE 1 \
            --set GDK_DPI_SCALE 0.5
        '';
      })

      # Communication
      mutt
      telegram-desktop
      thunderbird
      discord
      deluge

      # Office
      libreoffice

      # Coding
      alejandra
      nil
      nixd
      python3
      unstable.zed-editor
      (symlinkJoin {
        name = "obsidian-with-scale";
        paths = [obsidian];
        buildInputs = [makeWrapper];
        postBuild = ''
          # Wrap the code binary
          wrapProgram $out/bin/obsidian \
            --add-flags "--force-device-scale-factor=2"

          # Fix the desktop entry too
          sed -i 's|Exec=.*|Exec=$out/bin/obsidian --force-device-scale-factor=2 %F|' \
            $out/share/applications/obsidian.desktop
        '';
      })
    ];
  };

  home-manager.users.andrian = import ../../home/andrian.nix;
}
