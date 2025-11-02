{ config, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    xwayland = false;
    wrapperFeatures = {
      gtk = true;
    };
    systemdIntegration = true;
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
      export _JAVA_AWT_WM_NONREPARENTING=1
    '';
    config = import ./settings.nix;
  };

  programs.waybar = {
    enable = true;
    settings = import ./settings-waybar.nix;
    style = import ./style.css;
    systemd = {
      enable = true;
      target = "sway-session.target";
    };
  };
}
