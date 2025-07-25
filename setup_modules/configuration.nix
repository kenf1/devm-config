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

  # Necessary features for flakes
  nix.settings.experimental-features = "nix-command flakes";

  # Alternative shell support
  programs.zsh.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = pkgs.lib.mkDefault null;
  system.stateVersion = 6;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
