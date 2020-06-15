# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#Exports
export PATH="/usr/local/bin:${PATH}"
export GIT_CONFIG=~/.config/git/.gitconfig

#Alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt  autocd extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/ahegde/.zshrc'

fpath+=~/.zfunc

autoload -Uz compinit
compinit
# End of lines added by compinstall

### History stuff

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY            # append to history file
setopt HIST_NO_STORE             # Don't store history commands
###

### Misc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function fh() {
    eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

###

### zgen

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


###

### Keybindings
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
###

### SDKMan
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/ahegde/.sdkman"
[[ -s "/Users/ahegde/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/ahegde/.sdkman/bin/sdkman-init.sh"
 
### Theme
###

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#Git extra completions
source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
