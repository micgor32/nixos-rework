{
  mainBar = {
    layer = "top";
    position = "top";
    height = 30;
    output = [
      "eDP-1"
      "DP-1"
      "HDMI-A-1"
    ];
    modules-left = [
      "sway/workspaces"
      "sway/mode"
      "wlr/taskbar"
    ];
    modules-center = [
      "sway/window"
    ];
    modules-right = [
      "pulseaudio"
      "network"
      "cpu"
      "memeory"
      "temperature"
      "battery"
      "clock"
    ];
    "sway/workspaces" = {
      disable-scroll = true;
      all-outputs = true;
    };
  };
}
