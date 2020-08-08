# some useful aliases
alias nano='nano -wizF'
alias n='nano'
alias s="subl"
alias cat="bat"
alias f="fd"
alias g="rg"
alias lt='exa -TalFL3 --group-directories-first --git --color-scale'
alias ltd='exa -TalFDL3 --group-directories-first --git --color-scale'
alias l='exa -laF --group-directories-first --git --time-style=default --color-scale'
alias ll='l'
alias ls='exa -aF --group-directories-first'
alias l.='ll -D'
alias vi='vim'
alias df='df -h'
alias duf='du -sk ./* | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'
alias kshell='kubectl run -it alex-shell --image giantswarm/tiny-tools --restart Never --rm -- sh'
alias top='top -o cpu'
alias t="task"
alias tl="task sync &>/dev/null; task list"
alias ta="task add"
alias taw="task add +work"
alias tag="task add +gr"
alias tam="task add +me"
alias tas="task add +studio"
alias tav="task add +me +vacay"
alias tn="task sync &>/dev/null; task next"
alias tw="task sync &>/dev/null; task +work"
alias tg="task sync &>/dev/null; task +gr"
alias tm="task sync &>/dev/null; task +me"
alias ts="task sync &>/dev/null; task +studio"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

complete -o default -F __start_kubectl k

# some useful functions
function trm { [ $# -gt 0 ] && task $* delete || echo "At least one task ID is required"; }
function td { [ $# -gt 0 ] && yes | task $* done || echo "At least one task ID is required"; }
function tst { [ $# -gt 0 ] && task $* start || echo "At least one task ID is required"; }
function mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }