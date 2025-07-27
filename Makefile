.PHONY: setup_cleanup apply ajd adsd clean update \
	install_rust install_zed

setup_cleanup:
	brew analytics off

	cp -r ./remote_dotfiles/ ~/dotfiles/ && \
	cd ~/dotfiles && stow .

	git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

update:
	nix flake update

#apply + reset user.nix contents
define nix_apply
	sudo darwin-rebuild switch --flake ~/nix#$1
	brew analytics off
	git checkout -- user.nix
endef

#base config
apply: update
	$(call nix_apply,base)

#java dev
ajd: update
	$(call nix_apply,javadev)

#ds dev
adsd: update
	$(call nix_apply,dsdev)

clean:
	nix-collect-garbage

install_zed:
	curl -f https://zed.dev/install.sh | sh

install_rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh