{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    android-studio
    darwin.apple_sdk.frameworks.Xcode
  ];
}
