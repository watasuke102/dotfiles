
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

# lucid: surpress message that tells the plugin is loaded
# light-mode: load plugins as `light`; disables plugin reporting
zinit wait'0a' lucid light-mode for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay; zstyle ':completion:*' menu select" \
    zdharma-continuum/fast-syntax-highlighting \
  blockf \
    zsh-users/zsh-history-substring-search \
  blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions
# End of plugin

# disable beep
setopt nolistbeep
setopt no_beep
# misc
autoload -Uz colors && colors
setopt print_exit_value
setopt list_types # show marks for each completion targetted file

# save history
HISTFILE=~/.histfile
# on memory
HISTSIZE=1024
# on file
SAVEHIST=102400

## keymapping
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

# prompt
setopt PROMPT_SUBST
[[ -f ~/.git-prompt.sh ]] && source ~/.git-prompt.sh
# addされてないファイルがあるとき*, add済みかつcommitされていないとき+
GIT_PS1_SHOWDIRTYSTATE=true
# addされていない新規ファイルがあるとき%
GIT_PS1_SHOWUNTRACKEDFILES=true
PROMPT='%F{green}[${PROMPT_PREFIX}%*]%f %B%F{cyan}%~%f%b %F{yellow}$(__git_ps1 "<%s>")%f
%# '

# alias
[[ -f ~/.aliases ]] && source ~/.aliases
# functions
[[ -f ~/.func ]] && source ~/.func
# profile
[[ -f ~/.profile ]] && source ~/.profile

# environment value
export EDITOR=nvim
export LESS="--use-color --raw-control-chars --long-prompt --chop-long-lines --quit-if-one-screen"
export BAT_STYLE="header-filename,header-filesize,grid,snip"
export GPG_TTY=$(tty)
export QT_QPA_PLATFORMTHEME="gtk2"
export WLR_NO_HARDWARE_CURSORS=1

exist fzf && source <(fzf --zsh)

