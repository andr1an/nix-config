{pkgs, ...}: {
  services.xserver = {
    dpi = 180;
    upscaleDefaultCursor = true;
  };

  environment.variables = {
    GDK_SCALE = "2";
    GDK_DPI_SCALE = "0.5";
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };

  services.xserver.displayManager.lightdm.greeters.gtk.cursorTheme.size = 36;

  environment.systemPackages = with pkgs; [
    touchegg
    skippy-xd
  ];

  services.touchegg.enable = true;

  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };
}
