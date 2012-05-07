GALLOIS_PROMPT_HOST="%{$reset_color%}%{$fg_bold[green]%}%m%{$reset_color%}%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[gray]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[gray]%}]"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}" 
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}" 
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}" 


function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}


#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    #echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_dirty)$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

#RVM and git settings
#if [[ -s ~/.rvm/scripts/rvm ]] ; then 
  #RPS1='$(git_custom_status)%{$fg[red]%}[`~/.rvm/bin/rvm-prompt`]%{$reset_color%} $EPS1'
  RPS1='$(git_custom_status)%{$reset_color%}($GALLOIS_PROMPT_HOST%{$reset_color%})'
#fi

# PROMPT='%{$fg[cyan]%}[%~% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '
PROMPT='%{$fg[cyan]%}[%{$reset_color%}%{$fg[cyan]%}%50<..<${PWD/#$HOME/~}%<<%{$reset_color%}%{$fg[cyan]%}]%{$reset_color%}%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '

