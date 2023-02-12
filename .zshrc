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
alias vsc='code ./'

### GitHub CLI
alias gb='gh browse'

#### Issue
alias gia='gh issue create'
alias gil='gh issue list'
alias issue='gh issue list'
alias gis='gh issue status'
alias gic='gh issue close'
alias gico='gh issue comment'
alias gico='gh issue comment'

#### Pull request
alias gpa='gh pr create'
alias gpl='gh pr list'
alias pull='gh pr list'
alias gps='gh pr status'
alias gpch='gh pr checkout'
alias gpci='gh pr checks'
alias gpc='gh pr close'
alias gpco='gh pr comment'
alias gpready='gh pr ready'
alias gpreview='gh pr review'

# ------ END

# zsh options ------

HISTFILE=~/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

setopt AUTO_CD

setopt AUTO_PARAM_KEYS

# tmux -----

count=`ps aux | grep tmux | grep -v grep | wc -l`
if test $count -eq 0; then
    echo `tmux`
elif test $count -eq 1; then
    echo `tmux a`
fi

# ------ END

eval "$(starship init zsh)"
