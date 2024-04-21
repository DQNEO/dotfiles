all: $$HOME/dotfiles
	make brew
	#./install.sh

$$HOME/dotfiles:
	[  -e $@ ] || ln -s src/github.com/DQNEO/dotfiles $@

brew:
	brew bundle --file $$HOME/dotfiles/Brewfile



