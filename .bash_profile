# source .bashrc, if it exists
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# source grc to make colors pretty
if [ -f `brew --prefix`/etc/grc.bashrc ]; then
    source "`brew --prefix`/etc/grc.bashrc"
fi

# source .profile, if it exists
# this is mainly for rvm
if [ -f ~/.profile ]; then
   source ~/.profile
fi

if [ -f /usr/local/opt/dvm/dvm.sh ]; then
   source /usr/local/opt/dvm/dvm.sh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# Set the SSH vars so that ssh agent forwarding will work and start screen
#grabssh; screen -RDS alex;


