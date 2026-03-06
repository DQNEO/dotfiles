all: $$HOME/dotfiles
	make brew
	./install.sh

brew:
	brew bundle --file $$HOME/dotfiles/Brewfile



