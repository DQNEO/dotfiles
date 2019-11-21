all: $$HOME/dotfiles
	./install.sh
	make brew


$$HOME/dotfiles:
	cd $$HOME && ln -s src/github.com/DQNEO/dotfiles .

brew:
	./install-brew.sh


