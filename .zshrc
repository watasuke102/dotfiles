### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

##################################
## Plugins

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search
zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search

##################################
## End of plugin

# disable beep
setopt nolistbeep
setopt no_beep

setopt auto_cd
setopt printexitvalue

# enable complete
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# save history
HISTFILE=~/.histfile
HISTSIZE=4096
SAVEHIST=8192
setopt share_history

# enable color
autoload -Uz colors && colors

# alias
[[ -f ~/.aliases ]] && source ~/.aliases
# functions
[[ -f ~/.func ]] && source ~/.func
# profile
[[ -f ~/.profile ]] && source ~/.profile

## Key binds
# Home
bindkey "^[[1~"  beginning-of-line
bindkey "^[[H"  beginning-of-line
# Insert
bindkey -r "^[[2"
bindkey -r "^[[2~"
# Delete
bindkey "^[[3~" delete-char
# End
bindkey "^[[4~"  end-of-line
bindkey "^[[F"  end-of-line
# PageUp
bindkey -r "^[[5"
# PageDown
bindkey -r "^[[6"

# move word by Ctrl+Left or Right
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

## Value
export EDITOR=nvim
export BAT_STYLE="header-filename,header-filesize,grid,snip"
export GPG_TTY=$(tty)
export QT_QPA_PLATFORMTHEME="gtk2"
export WLR_NO_HARDWARE_CURSORS=1
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:${PKG_CONFIG_PATH}"
export LD_LIBRARY_PATH="/usr/local/lib:${LD_LIBRARY_PATH}"
export CC=clang
export CXX=clang++
#[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || export QT_QPA_PLATFORMTHEME="qt5ct"

## prompt
setopt PROMPT_SUBST
[[ -f ~/.git-prompt.sh ]] && source ~/.git-prompt.sh
# addされてないファイルがあるとき*, add済みかつcommitされていないとき+
GIT_PS1_SHOWDIRTYSTATE=true
# addされていない新規ファイルがあるとき%
GIT_PS1_SHOWUNTRACKEDFILES=true

PROMPT='%F{green}[${PROMPT_PREFIX}%*]%f %B%F{cyan}%~%f%b %F{yellow}$(__git_ps1 "<%s>")%f
%# '

# zsh-syntax-highlighting MUST be placed at the end of zshrc
zinit light zsh-users/zsh-syntax-highlighting

