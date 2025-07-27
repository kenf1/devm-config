{ config, lib, ... }:
{
  homebrew.casks = lib.mkAfter [
    "exifcleaner"
  ];
}
