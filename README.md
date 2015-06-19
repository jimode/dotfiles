##CLONING OUR DOTFILES TO ANOTHER MACHINE

Ultimately, we’re going to come to a point where we want to use our customized dotfiles on another server or workstation. That is, after all, one of the primary benefits of using Git to manage our dotfiles. To do this, it’s as simple as running the following command from our home directory:

git clone git://github.com/<mygithubusername>/dotfiles.git

Once the repository has been cloned to our home directory, simply change to the dotfiles directory, make the makesymlinks.sh script executable, and run the script, like so:

cd ~/dotfiles
chmod +x makesymlinks.sh
./makesymlinks.sh

Warning: If you’re running Debian Linux, this will most likely install zsh on your system if it isn’t already installed. This is a feature I added to my script to automate things as much as possible. If for some reason you don’t want zsh to be installed on your computer (e.g. you’re on somebody else’s server), remove the install_zsh line from makesymlinks.sh. This will cause it to set up all of your dotfiles without attempting to install zsh.

That’s it! If the settings don’t take effect right away, we can just log out and log back in (this will re-source our dotfiles).

UPDATING A LOCAL GIT REPO

The best way to explain this is with a scenario. Say we’ve created a repository on our workstation (Machine A) and we’ve pushed our changes to GitHub, then we’ve cloned these changes down to our server (Machine B). We then go back onto our workstation (Machine A), make more changes, and push them to GitHub. How do we get these changes onto our server (Machine B)? To do this, we use the git pull command:

git pull origin master

After running this command, Machine B will be current with any changes that were pushed to GitHub from Machine A. It quite literally pulls any updates to the repo from GitHub.




##Cloning onto another machine - Old clone instructions

When you’re working with a new machine onto which you’d like to clone your configuration, you clone the repository from GitHub, and delete any existing versions of those files in your home directory to replace them with symbolic links into your repository, like so:

$ git clone git@github.com:tejr/dotfiles.git .dotfiles

$ rm -r .vim .vimrc .screenrc .gitconfig

$ ln -s dotfiles/vim .vim

$ ln -s dotfiles/vimrc .vimrc

$ ln -s dotfiles/screenrc .screenrc

$ ln -s dotfiles/gitconfig .gitconfig

Finally, if you come back to use this machine later after you’ve tweaked these configuration files a bit and pushed them to GitHub, you can update them by just running a pull:

$ git pull
