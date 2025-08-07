{ ... }:
{
  homebrew = {
    enable = true;

    brews = [ ];

    casks = [
      "ghostty"
      "lulu"
      "github"
      "pearcleaner"
    ];

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}
