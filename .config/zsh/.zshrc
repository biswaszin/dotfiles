# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.9
#
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

### Download Zinit if it's not already installed
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

### Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k

zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins (cuz why not)
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab


# Load completions
autoload -U compinit && compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias cfg="nvim ~/.config/zsh/.zshrc"
alias cfgr="source ~/.config/zsh/.zshrc && echo '.zshrc is Reloaded!'"
alias ff="fastfetch"
alias cat="bat"
alias ls='eza --icons'
alias ll='eza -lh --icons --git'
alias la='eza -lah --icons --git'
alias fd='fdfind'
alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'
alias tree='eza --tree --icons'
compdef eza=ls

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# Path
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# FzF settings
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview 'bat --style=numbers --color=always {}'"

