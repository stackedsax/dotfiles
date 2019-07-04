# source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi


# add bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# load aliases and functions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# jenv
if which jenv > /dev/null; then 
    eval "$(jenv init -)"
fi

# start autoenv
if [ -f $(brew --prefix)/opt/autoenv/activate.sh ]; then
    . $(brew --prefix)/opt/autoenv/activate.sh
fi

if [ -f $(brew --prefix)/bin/gopass ]; then
    . <($(brew --prefix)/bin/gopass completion bash)
fi

if [ -f $(brew --prefix)/etc/bash_completion.d ]; then
    . <($(brew --prefix)/etc/bash_completion.d)
fi

if [ -f $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc ]; then
    . $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
fi

if [ -f $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc ]; then
    . $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc
fi

[ -f $(brew --prefix)/opt/nvm/etc/bash_completion ] && . $(brew --prefix)/opt/nvm/etc/bash_completion  # This loads nvm bash_completion

[ -f ~/dev/kubectl-aliases/.kubectl_aliases ] && . ~/dev/kubectl-aliases/.kubectl_aliases


# history handling
export HISTFILE=~/.bash_history
export HISTCONTROL=ignoreboth
export HISTSIZE=20000
export HISTFILESIZE=20000
export HISTTIMEFORMAT="%m/%d/%y %T "

# append to bash_history if Terminal.app quits
shopt -s histappend

# output history to history file immediately
export PROMPT_COMMAND='history -a'

# fix PATH for various brew things
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$HOME/bin:$PATH:/opt/chefdk:~/.local/bin:~/go/bin"

# default to ~/dev directory
# don't forget to put a trailing slash or else you 
# might slip into directories you do not want to be in
export CDPATH=./:~/:~/dev/:/etc/:/var/:../:../../

# old prompt that fixed screen sessions -- saved for historical purposes
#export PROMPT_COMMAND='history -a;source fixssh;echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\033\\"'
#COLOR=$(( 30 + ( $[0x`echo -n $PWD | hexdump -v -e '"\" 1/1 "%x" ""'`])%8))

# current minimalist prompt
PS1="\[\033[0;31m\][\[\033[0;33m\]\w\[\033[0;31m\]]"'$(__git_ps1 " (\[\033[0;36m\]%s\[\033[0;31m\])")'" $\[\033[0m\] "
shopt -s autocd
shopt -s cdspell

# fix commands like curl that don't add a newline at the end of their execution
shopt -s promptvars
#PS1='$(printf "%$((COLUMNS-1))s\r")'$PS1
PROMPT_DIRTRIM=4

# turn on colours
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# default editor
export EDITOR="nano -SwizF"

# for svn
export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

# make bash stop auto-completing hidden files
bind 'set match-hidden-files off'

# ansible
export ANSIBLE_HOSTS=~/ansible_hosts

# python
if [[ -r /usr/local/bin/virtualenvwrapper_lazy.sh ]]; then
    source /usr/local/bin/virtualenvwrapper_lazy.sh
else
    echo "WARNING: Can't find virtualenvwrapper_lazy.sh"
fi

# leaving this in just to feel secure that connections to Rackspace Cloud are using SSL
export CLOUD_VERIFY_SSL=True

# Free up Ctrl-S so that I can do forward-searches in bash
stty stop ''; stty start '';

#For Asciidoc
export XML_CATALOG_FILES=/usr/local/etc/xml/catalog

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
