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
    }:
    let
      configuration =
        { pkgs, ... }:
        {
          system.primaryUser = "devm";

          system.defaults = {
            dock.mru-spaces = false;
            finder.AppleShowAllExtensions = true;
            screencapture.location = "~/Downloads/screenshots";
            dock.persistent-apps = [
              "/Applications/Nix Apps/Firefox.app"
              "/Applications/Nix Apps/Brave Browser.app"
              "/Applications/GitHub Desktop.app"
              "/Applications/Nix Apps/VSCodium.app"
              "/Applications/Ghostty.app"
              "/System/Applications/System Settings.app"
            ];
            loginwindow.GuestEnabled = false;
            NSGlobalDomain.AppleInterfaceStyle = "Dark";
            NSGlobalDomain.KeyRepeat = 2;
            NSGlobalDomain.AppleEnableMouseSwipeNavigateWithScrolls = false;
            NSGlobalDomain.AppleEnableSwipeNavigateWithScrolls = false;
            NSGlobalDomain."com.apple.trackpad.trackpadCornerClickBehavior" = 1;
          };

          nixpkgs.config.allowUnfree = true;

          environment.systemPackages = [
            pkgs.nixfmt
            pkgs.stow
            pkgs.git
            pkgs.gnumake

            pkgs.bat
            pkgs.oh-my-posh
            pkgs.neovim

            pkgs.firefox-unwrapped
            pkgs.brave
            pkgs.vscodium
            pkgs.localsend

            #pkgs.go
            #pkgs.python313Full
            #pkgs.exif
            #pkgs.ipfetch
          ];

          homebrew = {
            enable = true;
            casks = [
              "ghostty"
              "github"
              #"exifcleaner"
            ];
            onActivation.cleanup = "zap";
            onActivation.autoUpdate = true;
            onActivation.upgrade = true;
          };

          fonts.packages = [
            pkgs.nerd-fonts.jetbrains-mono
          ];

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Enable alternative shell support in nix-darwin.
          programs.zsh.enable = true; # default shell

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 6;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."devm" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration

          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
              enableRosetta = false;

              # User owning the Homebrew prefix
              user = "devm";

              #existing install
              autoMigrate = true;
            };
          }
        ];
      };
      darwinPackages = self.darwinConfigurations."devm".pkgs;
    };
}
