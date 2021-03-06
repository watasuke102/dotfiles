### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

##################################
## Plugins

zplugin light zsh-users/zsh-syntax-highlighting
zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-completions
zplugin light jimhester/per-directory-history

##################################
## End of plugin


# disable beep
setopt nolistbeep
setopt no_beep

# enable complete
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
setopt completealiases
setopt auto_cd

# save history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt share_history

# enable color
autoload -Uz colors && colors

# alias
[[ -f ~/.aliases ]] && source ~/.aliases
# functions
[[ -f ~/.func ]] && source ~/.func


## Key binds
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
# move word by Ctrl+Left or Right
bindkey ";5C" forward-word
bindkey ";5D" backward-word


## prompt
PROMPT="[%*] %B%F{cyan}%~%f%b
%# "

## Display (for WSL)
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0
