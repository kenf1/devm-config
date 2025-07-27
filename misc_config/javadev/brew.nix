{ config, lib, ... }:
{
  homebrew = {
    brews = lib.mkAfter [ ];

    casks = lib.mkAfter [
      "intellij-idea-ce"
    ];
  };
}
