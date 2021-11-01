export PATH="$HOME/.pyenv/bin:$PATH"
export ZSH="/home/nicolas/.oh-my-zsh"
export EDITOR=nvim
source /usr/share/zsh/share/antigen.zsh
antigen bundle zsh-users/zsh-completions
antigen bundle darvid/zsh-poetry
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

plugins=(git docker python aws virtualenv nvm pyenv kubectl systemd minikube pip npm terraform)

alias s="cd .."
alias ktl="kubectl"
alias cat="bat"
eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
eval "$(direnv hook zsh)"
source $ZSH/oh-my-zsh.sh
