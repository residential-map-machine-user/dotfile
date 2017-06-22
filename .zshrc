#aliasの設定
alias vi=/usr/local/bin/vim
alias interval="defaults write org.eyebeam.SelfControl BlockDuration -int 450"
alias block="sudo /Applications/SelfControl.app/Contents/MacOS/org.eyebeam.SelfControl $(id -u $(whoami)) --install"
alias rake erd="rake erd --attributes=foreign_keys,primary_keys,content,timestamp --filename=erd_sample --filetype=png"
alias vim=nvim
alias server="ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 8000).start'"
alias gla="git-foresta --all --style=1 --graph-symbol-commit=★ --graph-symbol-tip=☆ --graph-margin-right=2 | less -RSX"
alias git lga="git-foresta --all --style=1 --graph-symbol-commit=★ --graph-symbol-tip=☆ --graph-margin-right=2 | less -RSX"
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

source $ZSH/oh-my-zsh.sh
#開発環境
#eval "$(rbenv init -)"
#eval "$(phpenv init -)"
eval "$(pyenv init -)"

#shellscript の実行
export TERM='xterm-256color'
