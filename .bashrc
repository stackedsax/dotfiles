## set some useful $PATHs
export PATH="$PATH:\
$HOME/bin:\
/usr/local/sbin:\
/usr/local/share/npm/bin:\
$HOME/go/bin:\
$HOME/.local/bin:\
/usr/local/opt/python@3.8/bin:\
$HOME/Library/Python/2.7/bin:\
$HOME/.cargo/bin:\
$HOME/.rvm/bin"

eval $(/opt/homebrew/bin/brew shellenv)

## Set bash prefix variable so I don't have to run brew over and over to get the 
## prefix.  Minor useless-optimization.
BREW_PREFIX=$(brew --prefix)


## add bash completion
#[ -f $BREW_PREFIX/etc/bash_completion ] && . $BREW_PREFIX/etc/bash_completion
[ -f "$BREW_PREFIX/etc/profile.d/bash_completion.sh" ] && . "$BREW_PREFIX/etc/profile.d/bash_completion.sh"

## load aliases and functions
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

## todoist completion
[ -f ~/dev/todoist/todoist_functions_fzf_bash.sh ] && . ~/dev/todoist/todoist_functions_fzf_bash.sh

## gcloud completion
[ -f $BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc ] && . $BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
[ -f $BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc ] && . $BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc

## nvm -- this adds considerable startup time to new shells so leaving off
## unless I'm doing node development
# export NVM_DIR="$HOME/.nvm"
# [ -s $BREW_PREFIX/opt/nvm/nvm.sh ] && . $BREW_PREFIX/opt/nvm/nvm.sh
# [ -s $BREW_PREFIX/opt/nvm/etc/bash_completion ] && . $BREW_PREFIX/opt/nvm/etc/bash_completion

## add dvm
## disabling for now since this interferes with SublimeREPL
# [ -f $BREW_PREFIX/opt/dvm/dvm.sh ] && . $BREW_PREFIX/opt/dvm/dvm.sh

## source grc to make colors pretty
[ -f $BREW_PREFIX/etc/grc.bashrc ] && . $BREW_PREFIX/etc/grc.bashrc

## lots of kubectl shortcuts
[ -f ~/dev/kubectl-aliases/.kubectl_aliases ] && . ~/dev/kubectl-aliases/.kubectl_aliases

## add fzf
[ -f ~/.fzf.bash ] && . ~/.fzf.bash

## Add Todoist Functions
#[ -f $BREW_PREFIX/share/zsh/site-functions/_todoist_fzf ] && . $BREW_PREFIX/share/zsh/site-functions/_todoist_fzf

## Load RVM into a shell session *as a function*
[ -s $HOME/.rvm/scripts/rvm ] && . $HOME/.rvm/scripts/rvm

## pyenv, jenv, direnv
command -v pyenv 1>/dev/null 2>&1 && eval "$(pyenv init -)"
command -v jenv 1>/dev/null 2>&1 && eval "$(jenv init -)"
command -v direnv 1>/dev/null 2>&1 && eval "$(direnv hook bash)"

## zoxide
command -v zoxide > /dev/null 2>&1 && eval "$(zoxide init bash)"

## history handling
export HISTFILE=~/.bash_history
export HISTCONTROL=ignoredups
export HISTSIZE=20000
export HISTFILESIZE=20000
export HISTTIMEFORMAT="%m/%d/%y %T "

## output history to history file immediately
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

## current minimalist prompt
PS1="\[\033[0;31m\][\[\033[0;33m\]\w\[\033[0;31m\]]"'$(__git_ps1 " (\[\033[0;36m\]%s\[\033[0;31m\])")'" $\[\033[0m\] "
PROMPT_DIRTRIM=4

## autocd: when I'm too lazy to type 'z'
## cdspell: fix my cd mistakes for me, please
## promptvars: fix commands like curl that don't add a newline at the end of their execution
shopt -s autocd cdspell promptvars

## add some useful paths to CDPATH
export CDPATH="\
./:\
~/:\
~/dev/:\
/etc/:\
/var/:\
../:\
../../"

## turn on colours
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export GREP_OPTIONS='--color=auto'

## default editor
export EDITOR="nano -wizF"
export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

## make bash stop auto-completing hidden files
bind 'set match-hidden-files off'

## ansible
export ANSIBLE_HOSTS=~/ansible_hosts

## turn off homebrew updating; use homebrew-autoupdate instead
export HOMEBREW_NO_AUTO_UPDATE="1"

## free up Ctrl-S so that I can do forward-searches in bash
stty stop ''; stty start '';
