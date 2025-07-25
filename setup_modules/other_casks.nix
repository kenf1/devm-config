{ ... }:
{
  homebrew = {
    enable = true;
    casks = [
      "exifcleaner"
      "pearcleaner"
    ];
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
}
