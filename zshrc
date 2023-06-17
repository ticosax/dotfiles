export PATH="$HOME/.pyenv/bin:${HOME}/.krew/bin:${HOME}/.cargo/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export SYSTEMD_EDITOR=nvim
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
source /usr/share/zsh/share/antigen.zsh
antigen bundle zsh-users/zsh-completions
antigen bundle darvid/zsh-poetry
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# https://github.com/hsaunders1904/pyautoenv
plugins=(git docker python aws virtualenv nvm pyenv kubectl systemd minikube pip npm terraform postgres pyautoenv)

alias s="cd .."
alias ktl="kubectl"
alias k="kubectl"
alias cat="bat"
alias bootstrap-neovim="pip install -U pynvim python-lsp-server pyls-flake8 pyls-isort python-lsp-black pyls-memestra mypy-ls debugpy jedi-language-server pylsp-rope"
eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
eval "$(direnv hook zsh)"
eval "$(mcfly init zsh)"
source $HOME/.oh-my-zsh/oh-my-zsh.sh
