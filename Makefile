.PHONY: setup_cleanup apply clean update \
	sndc \
	install_rust install_zed

setup_cleanup:
	brew analytics off

	cp -r ./remote_dotfiles/ ~/dotfiles/ && \
	cd ~/dotfiles && stow .

apply:
	sudo darwin-rebuild switch --flake ~/nix#devm
	brew analytics off

clean:
	nix-collect-garbage

update:
	nix flake update

sndc: #Setup nix dev container
	cp -r devcontainer-nix/.devcontainer .devcontainer

install_zed:
	curl -f https://zed.dev/install.sh | sh

install_rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh