.PHONY: setup_cleanup base basedev javadev dsdev clean update \
	install_rust install_zed

setup_cleanup:
	brew analytics off

	cp -r ./remote_dotfiles/ ~/dotfiles/ && \
	cd ~/dotfiles && stow .

	git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
	sh ./scripts/codium_ext.sh

update:
	nix flake update

#apply + reset user.nix contents
define nix_apply
	sudo darwin-rebuild switch --flake ~/nix#$1
	brew analytics off
	git restore --staged -- user.nix && git restore user.nix
endef

#base config
base: update
	$(call nix_apply,base)

#base dev wrapper
basedev: base setup_cleanup clean
	git config --global core.editor nvim

#java dev
javadev: update clean
	$(call nix_apply,javadev)

#ds dev
dsdev: update clean
	$(call nix_apply,dsdev)

clean:
	nix-collect-garbage

install_zed:
	curl -f https://zed.dev/install.sh | sh

install_rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh