{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    dmidecode
    lm_sensors
    pciutils
    usbutils
    hdparm
    nvme-cli
    ethtool
    smartmontools
    parted
  ];

  services.smartd.enable = true;
}
