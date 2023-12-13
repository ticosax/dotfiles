export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.local/bin/:$HOME/bin:$PYENV_ROOT/bin:${HOME}/.krew/bin:${HOME}/.cargo/bin:${HOME}/go/bin:$HOME/.jenv/bin:$PATH"
export EDITOR=lvim
export SYSTEMD_EDITOR=nvim
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export PYTHON_KEYRING_BACKEND=keyring.backends.fail.Keyring
export DISABLE_AUTO_UPDATE=true
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin/
source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh
# antigen bundle zsh-users/zsh-completions
antigen bundle darvid/zsh-poetry
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mroth/evalcache
antigen apply

eval "$(pyenv init --path)"
# https://github.com/hsaunders1904/pyautoenv
plugins=(git docker python aws virtualenv pyenv kubectl systemd minikube pip npm terraform postgres pyautoenv evalcache)
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

alias s="cd .."
alias ktl="kubectl"
alias k="kubectl"
alias cat="bat"
# _evalcache pyenv init --path
# _evalcache pyenv virtualenv-init -
_evalcache direnv hook zsh
_evalcache jenv init -
# eval "$(mcfly init zsh)"
# eval "$(fnm env --use-on-cd)"
# fpath+=~/.config/zsh/completions/_fnm
# compinit
