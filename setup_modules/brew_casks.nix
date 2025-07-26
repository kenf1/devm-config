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

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}
