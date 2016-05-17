# some useful aliases
alias nano='nano -SwizF'
alias n='nano -SwizF'
alias l.='ls -dp .*'
alias l='ls -lp'
alias ll='ls -lap'
alias ls='ls -p'
alias vi='vim'
alias sd='svn update'
alias df='df -h'
alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'
alias top='top -o cpu'
alias t="task"
alias tl="task sync &>/dev/null; task list"
alias ta="task add"
alias taw="task add +work"
alias tam="task add +me"
alias tn="task next"
alias tw="task +work"
alias tm="task +me"
alias ts="task +studio"
alias mou="open -a Mou.app"
alias cat='pygmentize -g -O style=colorful'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# some useful functions
function g { grep -Rin "$*" * | grep -v svn; }
function f { find . -iname "*$**" | grep -v svn; }
function trm { task $* delete; }
function sc { /Applications/SopCast.app/Contents/Resources/binaries/m32/sp-sc-auth $* 3908 8902 > /dev/null; }
function td { yes | task $* done; } 
function ts { task $* start; } 
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
