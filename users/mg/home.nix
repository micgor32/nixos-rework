{pkgs, ...}: {
  imports = [
    ../../home/core.nix
    ../../home/programs
    ../../home/shell
    ../../home/sway
  ];

  programs.git = {
    userName = "Michal Gorlas";
    userEmail = "michal.gorlas@9elements.com";
  };
}
