## My dotfiles

One line install for dev machine fleet. Try curl, fallback to wget.

### Linux

```shell
curl -fsSL https://raw.githubusercontent.com/kenf1/dotfiles/refs/heads/main/scripts/linux_setup.sh | sh || wget -qO- https://raw.githubusercontent.com/kenf1/dotfiles/refs/heads/main/scripts/linux_setup.sh | sh
```

### macOS

1. Download nix + nix-darwin
2. Git clone repo
3. Install everything + cleanup & start working

```shell
curl -fsSL https://raw.githubusercontent.com/kenf1/dotfiles/refs/heads/main/scripts/initial_setup.sh
```
