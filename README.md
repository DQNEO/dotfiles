# Prerequiesit

Install homebrew


# Installation

```sh
cd $HOME
git clone https://github.com/DQNEO/dotfiles.git src/github.com/DQNEO/dotfiles
make -C src/github.com/DQNEO/dotfiles
```

# After setting ssh to GitHub

```
cd ~/src/github.com/DQNEO/dotfiles
git remote -v
git remote remove origin
git remote add origin git@github.com:DQNEO/dotfiles
git pull --ff-only
```


