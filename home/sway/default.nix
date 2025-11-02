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

  programs = {
    waybar = {
      enable = true;
      settings = import ./settings-waybar.nix;
      style = import ./style.css;
      systemd = {
        enable = true;
        target = "sway-session.target";
      };
    };

    fuzzel = {
      enable = true;
      settings = {
        colors = {
          background = "1e1e2edd";
          text = "cdd6f4ff";
          prompt = "bac2deff";
          placeholder = "7f849cff";
          input = "cdd6f4ff";
          match = "a6e3a1ff";
          selection = "585b70ff";
          selection-text = "cdd6f4ff";
          selection-match = "a6e3a1ff";
          counter = "7f849cff";
          border = "a6e3a1ff";
        };
      };
    };
  };
}
