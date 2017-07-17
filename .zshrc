#aliasの設定
alias vi=/usr/local/bin/vim
alias search="find . -type f -print | xargs grep --color=auto -n "

#zshの設定
plugins=(git)
#schemeの設定
# 以下はお好みでカスタマイズ！
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status rbenv)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

#環境変数
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export PYENV_ROOT=$HOME/.pyenv
export XDG_CONFIG_HOME=$HOME/.config
export ZSH=$HOME/.oh-my-zsh
#localにinstall際に必要tmux
export LD_LIBRARY_PATH=${HOME}/local/lib:$LD_LIBRARY_PATH
PATH=/usr/local/sbin::/Users/$USER/.nodebrew/current/bin:/usr/local/bin:/Users/$USER/.mongodb/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Applications/Postgres.app/Contents/Versions/9.5/bin:$PYENV_ROOT/bin:HOME/.pyenv/shims:HOME/android-ndk-r10e:$HOME/.nodebrew/current/bin:$HOME/local/bin/:$PATH
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.phpenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/local/bin:$PATH"
ZSH_THEME="powerlevel9k/powerlevel9k"
alias t="tmux attach || tmux"
source $ZSH/oh-my-zsh.sh
#開発環境
#eval "$(rbenv init -)"
#eval "$(phpenv init -)"
# eval "$(pyenv init -)"

#shellscript の実行
export TERM='xterm-256color'
fhistory() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
zle -N fh
bindkey '^r' fh

function fselect-dir() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

zle -N fselect-dir
bindkey '^u' fselect-dir

fchrome() {
  local cols sep google_history open
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  if [ "$(uname)" = "Darwin" ]; then
    google_history="$HOME/Library/Application Support/Google/Chrome/Default/History"
    open=open
  else
    google_history="$HOME/.config/google-chrome/Default/History"
    open=xdg-open
  fi
  cp -f "$google_history" /tmp/h
  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open > /dev/null 2> /dev/null
}

fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}
fdocker() {
  ARGS="$@"
  if [[ $ARGS = 'docker ** docker' ]]; then
    _fzf_complete "--multi --reverse" "$@" < <(
        echo 'images'
        echo 'inspect'
        echo 'ps -a'
        echo 'rmi -f'
        echo 'rm'
        echo 'stop'
        echo 'start'
    )
  elif [[ $ARGS = 'docker ** rmi' || $ARGS = 'docker ** -f' ]]; then
    _fzf_complete "--multi --reverse" "$@" < <(
        docker images --format '{{.Repository}}:{{.Tag}}'
    )
  elif [[ $ARGS = 'docker ** start' || $ARGS = 'docker ** stop' || $ARGS = 'docker ** rm' ]]; then
    _fzf_complete "--multi --reverse" "$@" < <(
        docker ps -a --format '{{.Names}}'
    )
  fi
}
[ -n "$BASH" ] && complete -F _fzf_complete_docker -o default -o bashdefault docker
