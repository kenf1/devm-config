.PHONY: setup_cleanup apply clean update \
	install_nvc install_rust install_zed

setup_cleanup:
	brew analytics off

	cp -r ./remote_dotfiles/ ~/dotfiles/ && \
	cd ~/dotfiles && stow .

apply: update
	sudo darwin-rebuild switch --flake ~/nix#devm
	brew analytics off

clean:
	nix-collect-garbage

update:
	nix flake update

install_nvc:
	git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

install_zed:
	curl -f https://zed.dev/install.sh | sh

install_rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh