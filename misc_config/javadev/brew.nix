{ config, lib, ... }:
{
  homebrew = {
    brews = lib.mkAfter [
      "open-jdk"
    ];

    casks = lib.mkAfter [
      "intellij-idea-ce"
    ];
  };
}
