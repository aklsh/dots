# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$HOME/.local/custom:/usr/local/bin:$PATH
export PATH=/usr/bin/vendor_perl:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=/usr/local/cuda-11/bin:$PATH
export PATH=$HOME/.pyenv/bin:$PATH
export PATH=$HOME/.fly/bin:$PATH
export PATH=$HOME/.juliaup/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/.codon/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH=/home/aklsh/.oh-my-zsh
export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/firefox
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export CARGO_HOME=~/.local
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

export STARSHIP_CACHE=~/.starship/cache

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions zsh-syntax-highlighting zsh-completions direnv sudo man tmux fzf-tab extract colored-man-pages systemd docker docker-compose zsh-fzf-history-search)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
fpath+=/usr/share/vagrant/gems/gems/vagrant-2.3.4/contrib/zsh
source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
export MAKEFLAGS="-j13 --warn-undefined-variables"
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias zrc="nvim ~/.zshrc"
alias cat="bat"
alias ls="lsd"
alias luamake="/home/aklsh/Sources/lua-language-server/3rd/luamake/luamake"

# Misc auto-appends
export FLYCTL_INSTALL="/home/aklsh/.fly"
eval "$(direnv hook zsh)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(starship init zsh)"
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# Source local configs
source $HOME/.zshrc.local
