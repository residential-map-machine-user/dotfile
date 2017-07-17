#OSごとにファイルを読み込む
#aliasの設定
alias vi=/usr/local/bin/vim
alias search="find . -type f -print | xargs grep --color=auto -n "

#zshの設定
plugins=(git)
#schemeの設定
# 以下はお好みでカスタマイズ！
setopt auto_menu
setopt auto_pushd
setopt complete_aliases
setopt extended_glob
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_no_store
setopt hist_save_no_dups
setopt list_packed
setopt nolistbeep
setopt nonomatch
setopt notify
setopt pushd_ignore_dups
setopt share_history
setopt transient_rprompt
#環境変数
export PATH=$PATH:$GOPATH/bin
export PYENV_ROOT=$HOME/.pyenv
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export ZSH=$HOME/.oh-my-zsh
#localにinstall際に必要tmux
export LD_LIBRARY_PATH=${HOME}/local/lib:$LD_LIBRARY_PATH PATH=/usr/local/sbin::/Users/$USER/.nodebrew/current/bin:/usr/local/bin:/Users/$USER/.mongodb/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Applications/Postgres.app/Contents/Versions/9.5/bin:$PYENV_ROOT/bin:HOME/.pyenv/shims:$HOME/.nodebrew/current/bin:$HOME/local/bin/:$PATH
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.phpenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/local/bin:$PATH"
alias t="tmux attach || tmux"
#開発環境

#shellscript の実行
export TERM='xterm-256color'
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

function fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

zle -N fcd
bindkey '^u' fcd

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

# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fgco() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fssh() {
  ag '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf | xargs -o ssh
}
fstash() {
  local out q k sha
  while out=$(
    git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
    fzf --ansi --no-sort --query="$q" --print-query \
        --expect=ctrl-d,ctrl-b);
  do
    mapfile -t out <<< "$out"
    q="${out[0]}"
    k="${out[1]}"
    sha="${out[-1]}"
    sha="${sha%% *}"
    [[ -z "$sha" ]] && continue
    if [[ "$k" == 'ctrl-d' ]]; then
      git diff $sha
    elif [[ "$k" == 'ctrl-b' ]]; then
      git stash branch "stash-$sha" $sha
      break;
    else
      git stash show -p $sha
    fi
  done
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
case ${OSTYPE} in
  darwin*)
    export GOPATH=$HOME/.go
    source $ZSH/oh-my-zsh.sh
    eval "$(rbenv init -)"
    eval "$(phpenv init -)"
    eval "$(pyenv init -)"
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time context dir vcs)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status rbenv)
    POWERLEVEL9K_STATUS_VERBOSE=false
    POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
    ZSH_THEME="powerlevel9k/powerlevel9k"
    # ここに Mac 向けの設定
    ;;
  linux*)
    # ここに Linux 向けの設定
    ;;
esac
