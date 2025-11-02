{
  input = {
    "1:1:AT_Translated_Set_2_keyboard" = { xkb_layout = "de"; };
    "19280:4385:KP_REPUBLIC_BM60V2" = { xkb_layout = "us"; };
    "type:touchpad" = {
      tap = "enabled";
      tap_button_map = "lrm";
      drag = "enabled";
      click_method = "clickfinger";
      scroll_method = "two_finger";
      natural_scroll = "disabled";
      dwt = "disabled";
    };
    "type:tablet_tool" = {
      tool_mode = "pen relative";
      #tool_mode = "pencil relative";
    };
  };
  bars = [ ];
  # fonts = {
  #   names = [ "Fira Code Nerd Font" ];
  #   size = 10.0;
  # };
  gaps = {
    inner = 4;
    outer = 5;
    smartBorders = "on";
    smartGaps = true;
  };
  keybindings = let
    modifier = "Mod4";
    in {
      "${modifier}+Return" = "exec alacritty";
      "${modifier}+Shift+q" = "kill";

      "${modifier}+F1" = "exec chromium --ozone-platform=wayland";
      "${modifier}+F2" = "exec codium --ozone-platform=wayland";

      "${modifier}+h" = "focus left";
      "${modifier}+j" = "focus down";
      "${modifier}+k" = "focus up";
      "${modifier}+l" = "focus right";

      "${modifier}+Left" = "focus left";
      "${modifier}+Down" = "focus down";
      "${modifier}+Up" = "focus up";
      "${modifier}+Right" = "focus right";

      "${modifier}+Shift+h" = "move left";
      "${modifier}+Shift+j" = "move down";
      "${modifier}+Shift+k" = "move up";
      "${modifier}+Shift+l" = "move right";

      "${modifier}+Shift+Left" = "move left";
      "${modifier}+Shift+Down" = "move down";
      "${modifier}+Shift+Up" = "move up";
      "${modifier}+Shift+Right" = "move right";

      "${modifier}+b" = "splith";
      "${modifier}+v" = "splitv";
      "${modifier}+f" = "fullscreen toggle";
      "${modifier}+a" = "focus parent";

      "${modifier}+s" = "layout stacking";
      "${modifier}+w" = "layout tabbed";
      "${modifier}+e" = "layout toggle split";

      "${modifier}+Shift+space" = "floating toggle";
      "${modifier}+space" = "focus mode_toggle";

      "${modifier}+1" = "workspace number 1";
      "${modifier}+2" = "workspace number 2";
      "${modifier}+3" = "workspace number 3";
      "${modifier}+4" = "workspace number 4";
      "${modifier}+5" = "workspace number 5";
      "${modifier}+6" = "workspace number 6";
      "${modifier}+7" = "workspace number 7";
      "${modifier}+8" = "workspace number 8";
      "${modifier}+9" = "workspace number 9";

      "${modifier}+Shift+1" = "move container to workspace number 1";
      "${modifier}+Shift+2" = "move container to workspace number 2";
      "${modifier}+Shift+3" = "move container to workspace number 3";
      "${modifier}+Shift+4" = "move container to workspace number 4";
      "${modifier}+Shift+5" = "move container to workspace number 5";
      "${modifier}+Shift+6" = "move container to workspace number 6";
      "${modifier}+Shift+7" = "move container to workspace number 7";
      "${modifier}+Shift+8" = "move container to workspace number 8";
      "${modifier}+Shift+9" = "move container to workspace number 9";

      "${modifier}+Shift+minus" = "move scratchpad";
      "${modifier}+minus" = "scratchpad show";

      "${modifier}+Shift+c" = "reload";
      "${modifier}+Shift+e" = "exec swaynag -t warning -m 'Wanna exit sway?' -b 'Yes, exit sway' 'swaymsg exit'";

      "${modifier}+r" = "mode resize";

      "${modifier}+y" = "swaylock -f -c 0000000";
  };
}
