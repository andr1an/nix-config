{
  config,
  lib,
  osConfig,
  ...
}: {
  xfconf.settings = lib.mkIf (osConfig.services.xserver.desktopManager.xfce.enable or false) {
    "xsettings" = {
      "Net/ThemeName" = "Adwaita";
      "Net/IconThemeName" = "Tela-blue";
      "Gtk/FontName" = "PT Sans 10";
      "Gtk/MonospaceFontName" = "PT Mono 10";
      "Gtk/CursorThemeSize" = 36;
      "Xft/DPI" = 180;
      "Xft/Antialias" = 1;
      "Xft/Hinting" = 1;
      "Xft/HintStyle" = "hintslight";
      "Xft/RGBA" = "rgb";
    };
    "thunar" = {
      "default-view" = "ThunarDetailsView";
    };
    "xfwm4" = {
      "general/title_font" = "PT Sans Bold 10";
      "general/theme" = "Default-xhdpi";
      "general/easy_click" = "Super";
    };
    "xfce4-keyboard-shortcuts" = {
      "commands/custom/<Super>Return" = "exo-open --launch TerminalEmulator";
      "commands/custom/<Super>d" = "xfce4-appfinder -c";
      "commands/custom/<Super>e" = "thunar";
    };
    "xfce4-desktop" = {
      "backdrop/screen0/monitor0/image-path" = "${config.home.homeDirectory}/nixos-config/config/wallpaper.jpg";
      "backdrop/screen0/monitor0/workspace0/last-image" = "${config.home.homeDirectory}/nixos-config/config/wallpaper.jpg";
      "backdrop/screen0/monitoreDP-1/workspace0/last-image" = "${config.home.homeDirectory}/nixos-config/config/wallpaper.jpg";
    };
    "xfce4-panel" = {
      "panels" = [1 2];
      "panels/dark-mode" = true;

      "panels/panel-1/icon-size" = 16;
      "panels/panel-1/length" = 100;
      "panels/panel-1/plugin-ids" = [1 2 3 4 5 6 23 21 22 24 8 9 10];
      "panels/panel-1/position" = "p=6;x=0;y=0";
      "panels/panel-1/position-locked" = true;
      "panels/panel-1/size" = 26;

      "panels/panel-2/autohide-behavior" = 1;
      "panels/panel-2/background-style" = 0;
      "panels/panel-2/enter-opacity" = 100;
      "panels/panel-2/leave-opacity" = 100;
      "panels/panel-2/plugin-ids" = [7 11 12 13];
      "panels/panel-2/position" = "p=10;x=642;y=770";
      "panels/panel-2/position-locked" = true;
      "panels/panel-2/size" = 48;

      "plugins/plugin-1" = "applicationsmenu";
      "plugins/plugin-1/button-icon" = "distributor-logo-nixos";
      "plugins/plugin-1/button-title" = "Start";
      "plugins/plugin-1/show-button-title" = true;

      "plugins/plugin-2" = "tasklist";
      "plugins/plugin-2/grouping" = 1;

      "plugins/plugin-3" = "separator";
      "plugins/plugin-3/expand" = true;
      "plugins/plugin-3/style" = 0;

      "plugins/plugin-4" = "pager";

      "plugins/plugin-5" = "separator";
      "plugins/plugin-5/style" = 0;

      "plugins/plugin-6" = "systray";
      "plugins/plugin-6/square-icons" = true;

      "plugins/plugin-7" = "docklike";

      "plugins/plugin-8" = "clock";
      "plugins/plugin-8/digital-layout" = 3;
      "plugins/plugin-8/digital-time-font" = "PT Sans Narrow Condensed 10";

      "plugins/plugin-9" = "separator";
      "plugins/plugin-9/style" = 0;

      "plugins/plugin-10" = "actions";
      "plugins/plugin-10/items" = [
        "+lock-screen"
        "+switch-user"
        "+logout-dialog"
        "+separator"
        "+suspend"
        "-hibernate"
        "-hybrid-sleep"
        "-separator"
        "+shutdown"
        "+restart"
        "+separator"
        "+logout"
      ];

      "plugins/plugin-11" = "separator";

      "plugins/plugin-12" = "directorymenu";
      "plugins/plugin-12/base-directory" = "/home/andrian";
      "plugins/plugin-12/new-document" = false;

      "plugins/plugin-13" = "thunar-tpa";

      "plugins/plugin-21" = "power-manager-plugin";

      "plugins/plugin-22" = "pulseaudio";
      "plugins/plugin-22/enable-keyboard-shortcuts" = true;
      "plugins/plugin-22/known-players" = "firefox";

      "plugins/plugin-23" = "xkb";
      "plugins/plugin-23/display-name" = 1;
      "plugins/plugin-23/display-scale" = 100;
      "plugins/plugin-23/display-type" = 2;

      "plugins/plugin-24" = "notification-plugin";
    };
  };
}
