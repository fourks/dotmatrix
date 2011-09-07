source /usr/local/git/contrib/completion/git-completion.bash
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

# Convenience Commands
alias propane_font='vi +49 /Users/randland/Library/Application\ Support/Propane/styles/cf_chat.css'
alias hosts='sudo vi /etc/hosts'

# Bash Commands
alias bashedit='vi ~/.bash_aliases'
alias callme='sudo su -'
alias m.='mate .'
alias m=mate
alias please=sudo
alias psack='ps aux | ack'
alias psgrep='ps aux | grep'
alias rebash='pushd .; source ~/.bash_aliases; popd; c; l'
alias v='mvim'
alias v.='mvim .'

# Pickler Commands
alias curtest='cree cucumber FEATURE=$CURTEST'
alias curpush='pickler push $CURTEST'
alias curpull='pickler pull $CURTEST'
alias curstart='pickler start $CURTEST'
alias curfinish='pickler finish $CURTEST'
alias curdeliver='pickler deliver $CURTEST'
alias curspec='rspec $CURSPEC'

# Directory Navigation
alias ...='cd ../..;l;'
alias ..='cd ..;l;'
alias ~='cd ~;l;'
alias b='cd -;l;'
alias c=clear
alias d='ls -bF'
alias e='exit'
alias l='ls -aFG'
alias ll='l -l'
alias q=quit


# Git Commands
alias gadd='git add .'
alias gbr='git br'
alias gci='git ci -am'
alias gcl='git clone'
alias gco='git co'
alias gdel='git add -u'
alias gdf='clear; git diff -a -w'
alias gfull='clear; git status; git add .; git add -u; echo "****************"; git status; git ci -am'
alias gf='git flow'
alias git='. ~/.hitch_export_authors && git'
alias glog='clear; git log'
alias gme='git me'
alias gmv='git mv'
alias gpull='git pull'
alias gpush='git push'
alias greset='git reset --hard HEAD && git clean -fd'
alias grm='git rm'
alias gst='git status'
alias gtr="git tr"
alias gtree="git tree"
alias gtrim="sed -i '' -e 's/[[:space:]]*$//g'"

# Gem Commands
alias audit='gem list'
alias buy='gem install'
alias polish='gem update'
alias price='gem list -r'
alias recut='gem edit -e mvim'
alias sell='gem uninstall'
alias shop='gem search -r'
alias surplus='gem list | ack ","'

# Rails Commands
alias cr='c; yn rake'
alias deploy='cap_deploy.sh'
alias pgup='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgdown='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias rakedbtestkill='RAILS_ENV=test rake db:drop && RAILS_ENV=test rake db:create && rake db:test:prepare'
alias rb='ruby'
alias testenv='RAILS_ENV=test'

function rails_command {
  local cmd=$1
  shift
  if [ -e script/rails ]; then
    echo "script/rails $cmd \"$@\""
    script/rails $cmd "$@"
  else
    echo "script/$cmd \"$@\""
    script/$cmd "$@"
  fi
}
function ss {
  rails_command "server" "$@"
}
function sc {
  rails_command "console" "$@"
}
function sg {
  rails_command "generate" "$@"
}
function sr {
  rails_command "runner" "$@"
}
function sdb {
  rails_command "dbconsole" "$@"
}


# Bundle Commands
alias be='bundle exec'
alias becr='c; yn bundle exec rake'
alias berake='bundle exec rake'

function bundle_command {
  local cmd=$1
  shift
  if [ -e script/rails ]; then
    echo "bundle exec script/rails $cmd \"$@\""
    script/rails $cmd "$@"
  else
    echo "bundle exec script/$cmd \"$@\""
    script/$cmd "$@"
  fi
}
function bess {
  bundle_command "server" "$@"
}
function besc {
  bundle_command "console" "$@"
}
function besg {
  bundle_command "generate" "$@"
}
function besr {
  bundle_command "runner" "$@"
}
function besdb {
  bundle_command "dbconsole" "$@"
}

if [[ -s /Users/randland/.rvm/scripts/rvm ]] ; then source /Users/randland/.rvm/scripts/rvm ; fi
rvm use 1.9.2@global

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'
# Uncomment to persist pair info between terminal instances
hitch

# Use VI mode in bash
set -o vi

export RSPEC=true
export AUTOFEATURE=true
export RUBYOPT=rubygems

[ ! -f "$HOME/.bash_aliases.local" ] || . "$HOME/.bash_aliases.local"