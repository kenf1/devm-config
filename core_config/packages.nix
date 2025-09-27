{ pkgs, ... }:
{
  environment.systemPackages = (with pkgs; [
    nixfmt
    nixd
    nil #https://github.com/nix-community/vscode-nix-ide/issues/428
    stow
    git
    gnumake
    bat
    oh-my-posh
    fzf
    neovim

    firefox-unwrapped
    brave
    vscodium
    localsend
    gh
  ]);
}
