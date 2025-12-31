{
  boot.loader.refind = {
    extraConfig = ''
      include themes/custom/theme.conf
    '';
    additionalFiles = {
      "themes/custom/background.png" = ../../config/refind-theme-custom/background.png;
      "themes/custom/icons/func_about.png" = ../../config/refind-theme-custom/icons/func_about.png;
      "themes/custom/icons/func_exit.png" = ../../config/refind-theme-custom/icons/func_exit.png;
      "themes/custom/icons/func_reset.png" = ../../config/refind-theme-custom/icons/func_reset.png;
      "themes/custom/icons/func_shell.png" = ../../config/refind-theme-custom/icons/func_shell.png;
      "themes/custom/icons/func_shutdown.png" = ../../config/refind-theme-custom/icons/func_shutdown.png;
      "themes/custom/icons/os_mac.png" = ../../config/refind-theme-custom/icons/os_mac.png;
      "themes/custom/icons/os_nixos.png" = ../../config/refind-theme-custom/icons/os_nixos.png;
      # Use os_nixos.png for os_linux.png
      "themes/custom/icons/os_linux.png" = ../../config/refind-theme-custom/icons/os_nixos.png;
      "themes/custom/icons/os_openbsd.png" = ../../config/refind-theme-custom/icons/os_openbsd.png;
      "themes/custom/selection_big.png" = ../../config/refind-theme-custom/selection_big.png;
      "themes/custom/selection_small.png" = ../../config/refind-theme-custom/selection_small.png;
      "themes/custom/theme.conf" = ../../config/refind-theme-custom/theme.conf;
    };
  };
}
