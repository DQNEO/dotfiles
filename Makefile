all:
	make brew
	./install.sh

brew:
	brew bundle --file $$HOME/dotfiles/Brewfile



