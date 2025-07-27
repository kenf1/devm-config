{
  description = "Setup dev machine";

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
      commonModules = [
        ./core_config/configuration.nix
        ./core_config/packages.nix
        ./core_config/brew.nix
        ./core_config/fonts.nix
        nix-homebrew.darwinModules.nix-homebrew
      ];
    in
    {
      darwinConfigurations = {
        "base" = nix-darwin.lib.darwinSystem {
          modules = commonModules ++ [
            nix-homebrew.darwinModules.nix-homebrew
          ];
        };

        "javadev" = nix-darwin.lib.darwinSystem {
          modules = commonModules ++ [
            nix-homebrew.darwinModules.nix-homebrew
            ./misc_config/javadev/brew.nix
          ];
        };

        "dsdev" = nix-darwin.lib.darwinSystem {
          modules = commonModules ++ [
            nix-homebrew.darwinModules.nix-homebrew
            ./misc_config/dsdev/packages.nix
          ];
        };
      };
    };
}
