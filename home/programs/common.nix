{
  lib,
  pkgs,
  #catppuccin-bat,
  ...
}: {
  home.packages = with pkgs; [
    zip
    unzip
    ripgrep
    btop
    htop
    #nvtop
    libnotify
    xdg-utils
    graphviz
  ];

  programs = {
    tmux = {
      enable = true;
      aggressiveResize = true;
      clock24 = true;
      escapeTime = 0;
      historyLimit = 30000;
      newSession = true;
      secureSocket = false;
      plugins = with pkgs.tmuxPlugins; [
        vim-tmux-navigator
      ];
      shortcut = "a";
      keyMode = "vi";
      terminal = "tmux-256color";
      extraConfig = ''
        set-option -sa terminal-overrides ",xterm*:Tc"
        unbind C-b
        set -g prefix M-x
        bind M-x send-prefix
        set -g mouse on
        set -g base-index 1
        setw -g pane-base-index 1
        set -g status-keys vi
        set-window-option -g mode-keys vi
        '';
    };

    btop.enable = true; # replacement of htop/nmon
    #nvtop.enable = true;
    #eza.enable = true; # A modern replacement for ‘ls’
    #jq.enable = true; # A lightweight and flexible command-line JSON processor
    ssh.enable = true;
    #aria2.enable = true;

    # skim = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   defaultCommand = "rg --files --hidden";
    #   changeDirWidgetOptions = [
    #     "--preview 'exa --icons --git --color always -T -L 3 {} | head -200'"
    #     "--exact"
    #   ];
    # };
  };

  services = {
    swayidle = {
      enable = true;
      events = [
        { event = "before-sleep"; command = "swaylock -f -c 000000"; }
      ];
      timeouts = [
        { timeout = 900; command = "swaylock -f -c 000000"; }
        { timeout = 1200; command = "swaymsg output * dpms off"; resumeCommand = "swaymsg output * dpms on"; }
      ];
    };
  };
}
