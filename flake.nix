{
  description = "Setup devm";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
      homebrew-cask,
      ...
    }:

    let
      configurationModules = [
        ./setup_modules/configuration.nix
        ./setup_modules/core_packages.nix
        ./setup_modules/brew_casks.nix
        ./setup_modules/fonts.nix
        nix-homebrew.darwinModules.nix-homebrew
      ];
    in
    {
      darwinConfigurations."devm" = nix-darwin.lib.darwinSystem {
        modules = configurationModules;
      };

      darwinPackages = self.darwinConfigurations."devm".pkgs;
    };
}
