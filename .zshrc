export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/curl/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias em="emacsclient"

alias update_all="python2 $HOME/dev/update-script/updates.py"
alias fetch_upstream="git checkout master && git pull --rebase && git checkout - && git remote prune origin"

# Project specific
alias a="cd $HOME/Dropbox/School/University/2017/fall"
alias d="cd $HOME/dev"

function update_resume {
  cp $HOME/Dropbox/Work/Resume/LaTeX/resume.pdf $HOME/Dropbox/Work/Resume/Shine\ Wang\ -\ Resume.pdf
  cp $HOME/Dropbox/Work/Resume/LaTeX/resume.pdf $HOME/dev/shinew.github.io/resume.pdf
  cd $HOME/dev/shinew.github.io
  git add .
  git commit -m "updated resume"
  git push
}

function cip {
  git add .
  git --no-pager diff --patience HEAD
  read "REPLY?commit message(default 'z'): "
  if [ "$REPLY" = "" ]; then
    REPLY="z"
  fi
  git commit -m $REPLY
  git push
}

HISTSIZE=130000 SAVEHIST=130000
setopt PRINT_EXIT_VALUE

# OPAM configuration
. /Users/shine/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
eval `opam config env`
