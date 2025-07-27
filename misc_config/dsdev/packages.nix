{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    python313Full
    R

    quartoMinimal
    rstudio
  ];
}
