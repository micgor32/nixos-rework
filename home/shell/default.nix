{ pkgs, config, ...}: 
{
  imports = [
    ./common.nix
    ./terminals.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = pkgs.stdenv.isLinux;
    autocd = true;
    autosuggestion.enable = true;
    #dotDir = "${config.xdg.configHome}/zsh";
    history = {
      expireDuplicatesFirst = true;
      extended = true;
      ignoreDups = true;
      ignoreSpace = true;
      path = "${config.xdg.dataHome}/zsh/history";
      save = 10000;
      share = true;
    };
    envExtra = ''
      export LESSHISTFILE="${config.xdg.dataHome}/less_history"
      export CARGO_HOME="${config.xdg.cacheHome}/cargo"
      export SSH_AUTH_SOCK=/run/user/1000/ssh-agent.socket
      export GOPATH="${config.xdg.dataHome}/go"
    '';
    initContent = ''
      local ZVM_INIT_MODE=sourcing
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

      source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      source ${pkgs.zsh-autopair.src}/zsh-autopair.plugin.zsh
      source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh

      alias n="nvim"
      alias c="clear"
      alias la="ls -la"
      alias gits="git status"
      alias gita="git add"
      alias gitc="git commit -m"
      alias gitp="git push"
      alias e="emacs"

    '';
  };
}
