alias vi=/usr/local/bin/vim
alias rake erd="rake erd --attributes=foreign_keys,primary_keys,content,timestamp --filename=erd_sample --filetype=png"
alias gla="git lga"
ECLIPSE_HOME=/Applications/Eclipse.app/Contents/Eclipse
export ECLIPSE_HOME
PATH=$HOME/android-ndk-r10e:$HOME/Library/Android/sdk/platform-tools:$HOME/Library/Android/sdk/tools:$GRADLE_HOME/bin:$HOME/.nodebrew/current/bin:/usr/local/bin:$PATH
export PATH
alias toms=$HOME/tomcat7/bin/startup.sh
alias tomf=$HOME/tomcat7/bin/shutdown.sh
alias re="source  $HOME/.bash_profile"
alias vi="vim"
alias py="python3"
alias eclimd="$ECLIPSE_HOME/eclimd"
alias rake="bundle exec rake"
alias paraview="/Applications/paraview.app/Contents/MacOS/paraview"
#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/yukimatsuyama/.gvm/bin/gvm-init.sh" ]] && source "/Users/yukimatsuyama/.gvm/bin/gvm-init.sh"
export PYENV_ROOT="$HOME/.pyenv"
# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/yukimatsuyama/Downloads/cocos2d-x-3.8/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/yukimatsuyama/Downloads/cocos2d-x-3.8/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/Users/yukimatsuyama/android-ndk-r10e
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/Users/yukimatsuyama/Library/Android/sdk
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/Applications/Cocos/tools/ant/bin
export PATH=$ANT_ROOT:$PATH
export PATH="/usr/local/sbin:$PATH"

# Add environment variable COCOS_FRAMEWORKS for cocos2d-x
export COCOS_FRAMEWORKS=/Applications/Cocos/frameworks
export PATH=$COCOS_FRAMEWORKS:$PATH
# Path to your oh-my-zsh installation.
export ZSH=/Users/yukimatsuyama/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
alias act="activator"
eval "$(hub alias -s)"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/Applications/Cocos/frameworks:/usr/local/sbin:/Applications/Cocos/tools/ant/bin:/Users/yukimatsuyama/Library/Android/sdk/tools:/Users/yukimatsuyama/Library/Android/sdk/platform-tools:/Users/yukimatsuyama/Library/Android/sdk:/Users/yukimatsuyama/android-ndk-r10e:/Users/yukimatsuyama/Downloads/cocos2d-x-3.8/templates:/Users/yukimatsuyama/Downloads/cocos2d-x-3.8/tools/cocos2d-console/bin:/Users/yukimatsuyama/android-ndk-r10e:/Users/yukimatsuyama/Library/Android/sdk/platform-tools:/Users/yukimatsuyama/Library/Android/sdk/tools:/Users/yukimatsuyama/.gvm/gradle/current/bin:/Users/yukimatsuyama/.nodebrew/current/bin:/usr/local/bin:/Users/yukimatsuyama/.mongodb/bin:/Users/yukimatsuyama/.gvm/vertx/current/bin:/Users/yukimatsuyama/.gvm/springboot/current/bin:/Users/yukimatsuyama/.gvm/lazybones/current/bin:/Users/yukimatsuyama/.gvm/jbake/current/bin:/Users/yukimatsuyama/.gvm/groovyserv/current/bin:/Users/yukimatsuyama/.gvm/groovy/current/bin:/Users/yukimatsuyama/.gvm/griffon/current/bin:/Users/yukimatsuyama/.gvm/grails/current/bin:/Users/yukimatsuyama/.gvm/gradle/current/bin:/Users/yukimatsuyama/.gvm/glide/current/bin:/Users/yukimatsuyama/.gvm/gaiden/current/bin:/Users/yukimatsuyama/.gvm/crash/current/bin:/Users/yukimatsuyama/.gvm/asciidoctorj/current/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH=$PATH:~/act
PATH="/Applications/Postgres.app/Contents/Versions/9.5/bin:$PATH"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
eval "$(rbenv init -)"
