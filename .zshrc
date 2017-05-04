#aliasの設定
alias vi=/usr/local/bin/vim
alias interval="defaults write org.eyebeam.SelfControl BlockDuration -int 450"
alias block="sudo /Applications/SelfControl.app/Contents/MacOS/org.eyebeam.SelfControl $(id -u $(whoami)) --install"
alias rake erd="rake erd --attributes=foreign_keys,primary_keys,content,timestamp --filename=erd_sample --filetype=png"
alias gla="git lga"
alias server="ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 8000).start'"

#zshの設定
ZSH_THEME="agnoster"
plugins=(git)

#環境変数
export DRONE_SERVER=http://drone.mycompany.com
export DRONE_TOKEN=...
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export PATH="/Users/yukimatsuyama/.phpenv/bin:$HOME/.composer/vendor/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export ZSH=/Users/yukimatsuyama/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
PATH=/Applications/Cocos/frameworks:/usr/local/sbin:/Applications/Cocos/tools/ant/bin:/Users/yukimatsuyama/Library/Android/sdk/tools:/Users/yukimatsuyama/Library/Android/sdk/platform-tools:/Users/yukimatsuyama/Library/Android/sdk:/Users/yukimatsuyama/android-ndk-r10e:/Users/yukimatsuyama/Downloads/cocos2d-x-3.8/templates:/Users/yukimatsuyama/Downloads/cocos2d-x-3.8/tools/cocos2d-console/bin:/Users/yukimatsuyama/android-ndk-r10e:/Users/yukimatsuyama/Library/Android/sdk/platform-tools:/Users/yukimatsuyama/Library/Android/sdk/tools:/Users/yukimatsuyama/.gvm/gradle/current/bin:/Users/yukimatsuyama/.nodebrew/current/bin:/usr/local/bin:/Users/yukimatsuyama/.mongodb/bin:/Users/yukimatsuyama/.gvm/vertx/current/bin:/Users/yukimatsuyama/.gvm/springboot/current/bin:/Users/yukimatsuyama/.gvm/lazybones/current/bin:/Users/yukimatsuyama/.gvm/jbake/current/bin:/Users/yukimatsuyama/.gvm/groovyserv/current/bin:/Users/yukimatsuyama/.gvm/groovy/current/bin:/Users/yukimatsuyama/.gvm/griffon/current/bin:/Users/yukimatsuyama/.gvm/grails/current/bin:/Users/yukimatsuyama/.gvm/gradle/current/bin:/Users/yukimatsuyama/.gvm/glide/current/bin:/Users/yukimatsuyama/.gvm/gaiden/current/bin:/Users/yukimatsuyama/.gvm/crash/current/bin:/Users/yukimatsuyama/.gvm/asciidoctorj/current/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Applications/Postgres.app/Contents/Versions/9.5/bin:$PYENV_ROOT/bin:HOME/.pyenv/shims:HOME/android-ndk-r10e:$HOME/Library/Android/sdk/platform-tools:$HOME/Library/Android/sdk/tools:$GRADLE_HOME/bin:$HOME/.nodebrew/current/bin:$PATH
export PATH

#開発環境
eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(hub alias -s)"
