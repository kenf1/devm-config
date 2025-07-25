{ ... }:
{
  homebrew = {
    enable = true;
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
