# source zprofile 
if [ -f ~/.zprofile ]; then
	source ~/.zprofile
fi

# Path to your oh-my-zsh configuration.
ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallois_custom"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git history-substring-search)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#autoload -U down-line-or-beginning-search
#autoload -U up-line-or-beginning-search
#zle -N down-line-or-beginning-search
#zle -N up-line-or-beginning-search

#bindkey '^[[A' up-line-or-beginning-search
#bindkey '^[[B' down-line-or-beginning-search


source ~/.git-completion.sh
REPORTTIME=8

## history-substring-search configuration ##
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=cyan,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=red,bold'
HISTORY_SUBSTRING_SEARCH_FUZZY=fuzzy
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=unique

##### Aliases #####
# Fix bad corrections when using sudo
alias sudo='nocorrect sudo'

# List direcory contents
alias ls='LC_COLLATE=C ls --color=auto --group-directories-first'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias sl=ls


alias makec='make clean'
alias remake='make clean;make'

alias vims='vim -S Session.vim'
alias vimtex='vim --servername latex -c "colorscheme molokai"'
alias vimtexs='vimtex -S Session.vim'

#alias glg='git log --decorate --oneline --graph -M'
alias glg="git log --graph --decorate --pretty=format:'%C(bold blue)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %Cblue<%an>%Creset' --abbrev-commit --date=local"
alias glgg='git log --decorate --graph'
alias glgv='git log --decorate --stat -M'

export EDITOR=/usr/bin/vim
