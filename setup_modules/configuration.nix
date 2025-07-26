{ pkgs, ... }:
{
  system.primaryUser = "devm";

  system.defaults = {
    dock.orientation = "left";
    dock.mru-spaces = false;
    dock.persistent-apps = [
      "/Applications/Nix Apps/Firefox.app"
      "/Applications/Nix Apps/Brave Browser.app"
      "/Applications/GitHub Desktop.app"
      "/Applications/Nix Apps/VSCodium.app"
      "/Applications/Ghostty.app"
      "/Applications/Nix Apps/LocalSend.app"
      "/System/Applications/System Settings.app"
    ];

    finder.AppleShowAllExtensions = true;
    finder.NewWindowTarget = "Home";
    finder.FXRemoveOldTrashItems = true;
    finder.ShowPathbar = true;
    finder.ShowRemovableMediaOnDesktop = false;

    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain.KeyRepeat = 2;
    NSGlobalDomain.AppleEnableMouseSwipeNavigateWithScrolls = false;
    NSGlobalDomain.AppleEnableSwipeNavigateWithScrolls = false;
    NSGlobalDomain."com.apple.trackpad.trackpadCornerClickBehavior" = 1;

    screencapture.location = "~/Downloads/screenshots";
    loginwindow.GuestEnabled = false;
  };

  nixpkgs.config.allowUnfree = true;

  # Necessary features for flakes
  nix.settings.experimental-features = "nix-command flakes";

  # Alternative shell support
  programs.zsh.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = pkgs.lib.mkDefault null;
  system.stateVersion = 6;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
