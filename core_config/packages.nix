{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.nixfmt
    pkgs.stow
    pkgs.git
    pkgs.gnumake
    pkgs.bat
    pkgs.oh-my-posh
    pkgs.fzf
    pkgs.neovim

    pkgs.firefox-unwrapped
    pkgs.brave
    pkgs.vscodium
    pkgs.localsend
    pkgs.gh
  ];
}
