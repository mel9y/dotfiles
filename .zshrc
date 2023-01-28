gpg-connect-agent --quiet /bye

# zinit ------
## installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

## theme
# zinit ice pick"async.zsh" src"pure.zsh"
# zinit light sindresorhus/pure

## plugin
### zsh-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting
### zsh-autosuggestions
zinit light zsh-users/zsh-autosuggestions
### zsh-completions
zinit light zsh-users/zsh-completions
### anyframe
zinit light mollifier/anyframe

# ------ END

# nvm ------

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# ------ END

# peco(anyframe) ------

### command history
bindkey '^r' anyframe-widget-execute-history

### ghq list
bindkey '^g' anyframe-widget-cd-ghq-repository

# ------ END

# alias ----

alias clone='ghq get'
alias lg='lazygit'
alias g='lazygit'
alias vsc='code'
alias vsc-='code ./'

# ------ END

# zsh options ------

HISTFILE=~/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

setopt AUTO_CD

setopt AUTO_PARAM_KEYS

# ------ END

eval "$(starship init zsh)"
