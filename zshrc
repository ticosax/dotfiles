export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.local/bin/:$HOME/bin:$PYENV_ROOT/bin:${HOME}/.krew/bin:${HOME}/.cargo/bin:${HOME}/go/bin:$HOME/.jenv/bin:$PATH"
export EDITOR=nvim
export SYSTEMD_EDITOR=nvim
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export PYTHON_KEYRING_BACKEND=keyring.backends.fail.Keyring
export DISABLE_AUTO_UPDATE=true
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin/


if [ -d "/usr/share/zsh/scripts/zplug" ]; then
	source /usr/share/zsh/scripts/zplug/init.zsh
fi
if [ -f "$HOME/.zplug/init.zsh" ]; then
	source $HOME/.zplug/init.zsh
fi
zplug 'darvid/zsh-poetry'
zplug 'zsh-users/zsh-syntax-highlighting'

eval "$(pyenv init -)"
eval "$(starship init zsh)"
eval "$(pyenv virtualenv-init -)"
eval "$(direnv hook zsh)"
eval "$(jenv init -)"

# just --completions zsh > just.zsh
# source just.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch
unsetopt autocd beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle :compinstall filename '/home/ticosax/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# https://github.com/hsaunders1904/pyautoenv
plugins=(git docker python aws virtualenv pyenv kubectl systemd minikube pip npm terraform postgres pyautoenv virtualenvwrapper)
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

alias s="cd .."
alias ktl="kubectl"
alias k="kubectl"
alias cat="bat"
alias tf="terraform"

unsetopt correct_all
if [ -f $HOME/src/dotfiles/fluvio.zsh ]; then
  source $HOME/src/dotfiles/fluvio.zsh
fi
