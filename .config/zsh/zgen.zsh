###########
# zgen
###########

export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true

source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then

    # general plugins
    zgen load unixorn/autoupdate-zgen
    zgen load romkatv/powerlevel10k powerlevel10k
    zgen load zsh-users/zsh-autosuggestions
    zgen load zsh-users/zsh-completions
    zgen load rolling-space/zulu-utility
    zgen load hlissner/zsh-autopair
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zlsun/solarized-man
    zgen load rupa/z
    zgen load zulu-zsh/plugin-git
    zgen load zulu-zsh/plugin-z-cd
    zgen load zsh-users/zsh-history-substring-search
    zgen load lukechilds/zsh-nvm

    #OSX stuff
    zgen load rolling-space/zulu-homebrew
    zgen load iam4x/zsh-iterm-touchbar

    #bind keys
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down

    zgen save
fi

###########
