{ ... }:
{
  homebrew = {
    enable = true;

    brews = [
      "node"
      "oh-my-posh"
    ];

    casks = [
      "ghostty"
      "lulu"
      "github"
      "pearcleaner"
      "exifcleaner"
    ];

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}
