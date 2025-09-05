{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "devlinux";
    firewall.enable = true;
    interfaces = { };
  };

  environment.systemPackages = with pkgs; [
    git
    nvim
    htop
    curl
    wget
  ];

  virtualisation.docker.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # system.stateVersion = "23.05";
}
