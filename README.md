##Cloning onto another machine

When you’re working with a new machine onto which you’d like to clone your configuration, you clone the repository from GitHub, and delete any existing versions of those files in your home directory to replace them with symbolic links into your repository, like so:

$ git clone git@github.com:tejr/dotfiles.git .dotfiles

$ rm -r .vim .vimrc .screenrc .gitconfig

$ ln -s .dotfiles/vim .vim

$ ln -s .dotfiles/vimrc .vimrc

$ ln -s .dotfiles/screenrc .screenrc

$ ln -s .dotfiles/gitconfig .gitconfig

Finally, if you come back to use this machine later after you’ve tweaked these configuration files a bit and pushed them to GitHub, you can update them by just running a pull:

$ git pull
