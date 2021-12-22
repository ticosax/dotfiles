export PATH="$HOME/.pyenv/bin:$PATH:${HOME}/.krew/bin"
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
alias bootstrap-neovim="pip install -U pynvim python-lsp-server pyls-flake8 pyls-isort python-lsp-black pyls-memestra mypy-ls debugpy jedi-language-server"
eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
eval "$(direnv hook zsh)"
source $ZSH/oh-my-zsh.sh
