# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="bureau"
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
export WORKON_HOME=$HOME/.virtualenvs
plugins=(git django docker python zsh-completions aws virtualenvwrapper virtualenv zsh-nvm pyenv kubectl)

# poetry
fpath+=~/.zfunc

source $ZSH/oh-my-zsh.sh
# User configuration

bindkey -v
bindkey "^R" history-incremental-pattern-search-backward

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:/home/nicolas/.gem/ruby/2.5.0/bin:~/.npm-global/bin:$HOME/.poetry/bin:$HOME/.local/kitty.app/bin:$PATH
unsetopt INC_APPEND_HISTORY SHARE_HISTORY
# export MANPATH="/usr/local/man:$MANPATH"

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
alias s="cd .."
export PATH="$HOME/.pyenv/bin:$HOME/go/bin:$PATH"
export GOPATH="$HOME/go"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/home/nicolas/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
source $HOME/.cargo/env

source /usr/share/google-cloud-sdk/completion.zsh.inc

# added by travis gem
[ -f /home/nicolas/.travis/travis.sh ] && source /home/nicolas/.travis/travis.sh



export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

eval "$(direnv hook zsh)"

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Kitty
autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# https://github.com/sdispater/poetry/issues/571#issuecomment-474017926
alias poetry_shell=$'source "$(poetry debug:info | rg \'.*Path:[^/]+(.*)\' -r \'$1\')/bin/activate"'

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/nicolas/bin/terraform terraform
