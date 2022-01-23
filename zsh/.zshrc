# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$HOME/.local/custom:/usr/local/bin:$PATH
export PATH=/usr/bin/vendor_perl:$PATH
export PATH=/opt/MATLAB/R2021b/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=/usr/lib/cuda-11.2/bin:$PATH
export PATH=$HOME/.pyenv/bin:$PATH
export PATH=$FORGIT_INSTALL_DIR/bin:$PATH
export PATH=$PATH:/usr/local/lib/
export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH

TOOLS=/opt/tools
export PATH=$TOOLS/bluespec/bsc/bin:$PATH
export PATH=$TOOLS/bluespec/bdw/bin:$PATH
export PATH=$TOOLS/verilator/bin:$PATH
export PATH=$TOOLS/iverilog/bin:$PATH
export PATH=$TOOLS/gtkwave/bin:$PATH
export PATH=$TOOLS/yosys/bin:$PATH
export PATH=$TOOLS/icestorm/bin:$PATH
export PATH=$TOOLS/nextpnr/bin:$PATH
export PATH=$TOOLS/magic/bin:$PATH
export PATH=$TOOLS/kicad/bin:$PATH
export PATH=$TOOLS/netgen/bin:$PATH
export PATH=$TOOLS/riscv/bin:$PATH
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"

# Path to your oh-my-zsh installation.
export ZSH="/home/aklsh/.oh-my-zsh"
export EDITOR="/usr/bin/nvim"
export BROWSER="/usr/bin/firefox"

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
export MAKEFLAGS="-j13"
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias zrc="nvim ~/.zshrc"
alias cat="bat"
alias find="fdfind"
alias luamake=/home/aklsh/Sources/lua-language-server/3rd/luamake/luamake

# Misc auto-appends
eval "$(direnv hook zsh)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(starship init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zshrc.local
