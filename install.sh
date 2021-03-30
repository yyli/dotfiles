#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="git-completion.sh gitconfig vimrc zshrc oh-my-zsh"    # list of files/folders to symlink in homedir

##########

# install zsh function
function install_zsh {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone https://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        sudo chsh -s $(which zsh) $USER
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        sudo apt-get install zsh
        install_zsh
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

# create dotfiles_old in homedir
echo "Creating $olddir for backup"
mkdir -p $olddir
echo ""

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo ""

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    if [ -f ~/Downloads ] || [ -d ~/Downloads ]; then
        echo "Moving .$file to $olddir/.$file"
        mv ~/.$file ~/dotfiles_old/
        
    fi
    echo "Creating symlink to $file"
	if [ ! -f ~/.$file ]; then
		ln -s $dir/$file ~/.$file
	else
		echo "Warning: already symlinked"
	fi

    echo ""
done

# run install_zsh
echo "Installing and setting up zsh"
install_zsh
echo ""

# symlink the custom theme into the theme folder
echo "Linking theme"
if [ ! -f $dir/oh-my-zsh/themes/gallois_custom.zsh-theme ]; then
    ln -s $dir/gallois_custom.zsh-theme $dir/oh-my-zsh/themes/gallois_custom.zsh-theme
else
    echo "Warning: theme already linked"
fi
echo ""

# make vim undo folder
echo "Making vim undo folder"
mkdir -p ~/.vim/undo
