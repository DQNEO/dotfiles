all: $$HOME/dotfiles
	make brew
	./install.sh



$$HOME/dotfiles:
	cd $$HOME && ln -s src/github.com/DQNEO/dotfiles .

brew:
	brew bundle --file $$HOME/dotfiles/Brewfile



