{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/system.nix
    #../../modules/sway.nix
    ./hardware-configuration.nix
  ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    systemd-boot.enable = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  time.timeZone = "Europe/Berlin";

  networking.hostName = "drk-desktop";
  networking.networkmanager.enable = true;

  services.xserver.videoDrivers = ["amdgpu"];
  hardware.opengl.enable = true;
  hardware.amdgpu = {
    opencl.enable = true;
  };

  system.stateVersion = "25.05";
}
