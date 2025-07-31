{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    jdk24
    # jetbrains.idea-community-src
  ];
}
