.PHONY: cleanup

setup_cleanup:
	brew analytics off

	cp -r ../remote_dotfiles/ ~/dotfiles/ && \
	cd ~/dotfiles && stow .

apply:
	sudo darwin-rebuild switch --flake ~/nix#devm

clean:
	nix-collect-garbage

update:
	nix flake update