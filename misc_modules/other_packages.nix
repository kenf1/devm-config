{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.go
    pkgs.python313Full
    pkgs.exif
    pkgs.ipfetch
  ];
}
