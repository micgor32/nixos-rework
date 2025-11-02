{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    zip
    unzip
    ripgrep
    btop
    htop
    libnotify
    xdg-utils
    graphviz
    networkmanagerapplet
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
        set -g status-bg black
        set -g status-fg white
        set -g status-keys vi
        set-window-option -g mode-keys vi
        '';
    };

    helix = {
      enable = true;
      settings = {
        theme = "dark-synthwave";
        editor.lsp.display-messages = true;
        editor.cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        keys.normal = {
          space.B = ":echo %sh{git blame -L %{cursor_line},+1 %{buffer_name}}";
          space.v = "vsplit";
          space.h = "hsplit";
          space.q = "wclose";
          space.w = "rotate_view";
        };
      };
      languages.language = [{
        name = "nix";
        auto-format = true;
        formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
      }];
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
