{pkgs, ...}: {
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
