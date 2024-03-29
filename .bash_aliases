# some useful aliases
alias nano='nano -wiF'
alias n='nano'
alias s="subl"
alias cat="bat"
alias f="fd -I"
alias g="rg -i"
alias lt='exa -TalFL3 --group-directories-first --git --color-scale'
alias ltd='exa -TalFDL3 --group-directories-first --git --color-scale'
alias l='exa -laF --group-directories-first --git --time-style=default --color-scale'
alias ll='l'
alias ls='exa -aF --group-directories-first'
alias l.='ll -D'
alias less='less -r'
alias vi='vim'
alias df='df -h'
alias duf='du -sk ./* | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'
alias kshell='kubectl run -it alex-shell --image giantswarm/tiny-tools --restart Never --rm -- sh'
alias top='top -o cpu'
# alias t="task"
# alias tl="task sync &>/dev/null; task list"
# alias ta="task add"
# alias taw="task add +work"
# alias tag="task add +gr"
# alias tam="task add +me"
# alias tas="task add +studio"
# alias tav="task add +me +vacay"
# alias tn="task sync &>/dev/null; task next"
# alias tw="task sync &>/dev/null; task +work"
# alias tg="task sync &>/dev/null; task +gr"
# alias tm="task sync &>/dev/null; task +me"
# alias ts="task sync &>/dev/null; task +studio"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# CDPATH is great, but if the directory exists directly, go there
_my_cd () { CDPATH= _cd "$@"; if [ -z "$COMPREPLY" ]; then _cd "$@"; fi;}
complete -F _my_cd -o nospace cd

# kubectl autocompletion.  To set this up, run:
# $ kubectl completion bash > $(brew --prefix)/etc/bash_completion.d/kubectl
# Not great, but maybe I'll create a brew package someday to do this for me...
complete -o default -F __start_kubectl k

# some useful functions for taskwarrior
# function trm { [ $# -gt 0 ] && task $* delete || echo "At least one task ID is required"; }
# function td { [ $# -gt 0 ] && yes | task $* done || echo "At least one task ID is required"; }
# function tst { [ $# -gt 0 ] && task $* start || echo "At least one task ID is required"; }

# some useful functions
function trm { [ $# -gt 0 ] && todoist --color delete $* || echo "At least one todoist ID is required"; }
function tc { [ $# -gt 0 ] && yes | todoist --color close $* || echo "At least one todoist ID is required"; }
function td { [ $# -gt 0 ] && yes | todoist --color close $* || echo "At least one todoist ID is required"; }
function mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

. ~/.bash_completion.d/complete_alias
alias tc='todoist --color c'

alias t="todoist --color"
alias task="todoist --color"
function ta { [ $# -gt 0 ] && todoist --color add -P 2246705149 "$*" || echo "Please enter task description"; }
function taw { [ $# -gt 0 ] && todoist --color add -P 2247262858 "$*" || echo "Please enter task description"; }
function tai { [ $# -gt 0 ] && todoist --color add -P 2247262858 "$*" || echo "Please enter task description"; }
function tag { [ $# -gt 0 ] && todoist --color add -P 2247262859 "$*" || echo "Please enter task description"; }
function tam { [ $# -gt 0 ] && todoist --color add -P 2247262861 "$*" || echo "Please enter task description"; }
function tas { [ $# -gt 0 ] && todoist --color add -P 2247262860 "$*" || echo "Please enter task description"; }
alias tl="todoist sync &>/dev/null; todoist --color list"
alias tw='todoist sync &>/dev/null; todoist --color list -f "#ISC"'
alias ti='todoist sync &>/dev/null; todoist --color list -f "#ISC"'
alias tg='todoist sync &>/dev/null; todoist --color list -f "#gr"'
alias tm='todoist sync &>/dev/null; todoist --color list -f "#me & !#Welcome"'
alias ts='todoist sync &>/dev/null; todoist --color list -f "#studio"'

complete -F _complete_alias tc
complete -F _complete_alias t
complete -F _complete_alias tl
complete -F _complete_alias task
complete -W "todoist delete" td
complete -F _complete_alias tc
complete -F _complete_alias trm
