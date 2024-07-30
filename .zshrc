# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"
fpath+=("$(brew --prefix)/share/zsh/site-functions")
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gitfast zsh-autosuggestions zsh-syntax-highlighting battery web-search last-working-dir)

source $ZSH/oh-my-zsh.sh

# User configuration

# ---------------- environment variables ------------------

export SECOND_BRAIN="$HOME/Documents/second-brain"
export SCRIPTS="$HOME/Documents/scripts"
export GOPATH=$HOME/go
export PATH="$PATH:$SCRIPTS:$GOPATH/bin/"
export STX="$HOME/Documents/stxnext/"
export BAT_THEME="gruvbox-dark"
export DOTFILES="$HOME/dotfiles/"
# export MANPATH="/usr/local/man:$MANPATH"
#
# autocompletion 1Password
eval "$(op completion zsh)"; compdef _op op
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh" 
# Disk aliases
alias lsdisk="diskutil list"
alias eject="diskutil eject"

alias v=nvim
alias oo="cd ~/Documents/vaults/work/"

#ls aliases
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias pip="/usr/local/bin/pip"
alias vim="nvim"
alias ls="eza --grid --color=auto --icons=always --sort=type"
alias ll='eza --long --header --color=always --icons=always --sort=type'
alias la='eza --grid --all --color=auto --icons=always --sort=type'
alias lla='eza --long --header --all --color=auto --icons=always --sort=type'

#fzf aliases
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias vf='v "$(fp)"'


#autocompletion snipe-cli on work laptop
if [[ -f $HOME/.snipe-cli-complete.zsh ]]; then
  . ~/.snipe-cli-complete.zsh
fi
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"


fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# pyenv-virtualenv
eval "$(pyenv init -)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PATH="/opt/metasploit-framework/bin/:$PATH"

eval "$(fzf --zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

j() {
    local preview_cmd="ls {2..}"
    if command -v eza &> /dev/null; then
        preview_cmd="eza -l --color=always --icons=always {2}"
    fi

    if [[ $# -eq 0 ]]; then
                  cd "$(autojump -s | sort -k1gr | awk -F : '$1 ~ /[0-9]/ && $2 ~ /^\t*\// {print $1 $2}' | fzf --height 40% --reverse --inline-info --preview "$preview_cmd" --preview-window down:50% | cut -d$'\t' -f2- | sed 's/^\s*//')"
    else
        cd $(autojump $@)
    fi
}


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/$USER/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/boorish/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/$USER/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/boorish/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(starship init zsh)"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

