#!/bin/bash

#edit .nix files, all others synced
for ext in jnoortheen.nix-ide jeff-hykin.better-nix-syntax evrohq.evro-dark
do
  codium --install-extension "$ext"
done