export PATH="$HOME/.pyenv/bin:${HOME}/.krew/bin:${HOME}/.cargo/bin:$PATH"
export EDITOR=nvim
export SYSTEMD_EDITOR=nvim
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export PYTHON_KEYRING_BACKEND=keyring.backends.fail.Keyring
source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-completions
antigen bundle darvid/zsh-poetry
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mroth/evalcache
antigen apply

# https://github.com/hsaunders1904/pyautoenv
plugins=(git docker python aws virtualenv pyenv kubectl systemd minikube pip npm terraform postgres pyautoenv evalcache)
source ~/.oh-my-zsh/oh-my-zsh.sh

alias s="cd .."
alias ktl="kubectl"
alias k="kubectl"
alias cat="bat"
# eval "$(pyenv init -)"
_evalcache pyenv init --path
_evalcache pyenv virtualenv-init -
_evalcache direnv hook zsh
# eval "$(mcfly init zsh)"
# eval "$(fnm env --use-on-cd)"
# fpath+=~/.config/zsh/completions/_fnm
compinit
