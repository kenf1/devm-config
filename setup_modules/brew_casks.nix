{ ... }:
{
  homebrew = {
    enable = true;

    brews = [ ];

    casks = [
      "ghostty"
      "lulu"
      "github"
    ];

    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
}
