########################################################
# Pre blocks #
########################################################

# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Powerlevel10k pre block. Should stay close to the top.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


########################################################
# Oh-My-Zsh configuration #
########################################################

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme configuration.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Display three red dots while waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Format of the command execution time stamp shown in the history command output
HIST_STAMPS="dd/mm/yyyy"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time


########################################################
# Other packages configurations #
########################################################

# NVM Configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# PNPM Configuration
export PNPM_HOME="/Users/bpruvost/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Android Studio Configuration
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home


########################################################
# User configurations #
########################################################

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='code'
 else
   export EDITOR='code'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


########################################################
# Plugins #
########################################################

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
	git
  brew
	zsh-syntax-highlighting
)

########################################################
# Aliases #
########################################################

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


###########################################################

source $ZSH/oh-my-zsh.sh


###########################################################

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


###########################################################
# ALIAS #
###########################################################

# get machine's ip address
alias ip="ipconfig getifaddr en0 || ipconfig getifaddr en1"

# edit global zsh configuration
alias zshconfig="vim ~/.zshrc"
# reload zsh configuration
alias zshsource="source ~/.zshrc"

# navigate to global ssh directory
alias sshfolder="cd ~/.ssh"
# edit global ssh configuration
alias sshconfig="vim ~/.ssh/config"

# edit global git configuration
alias gitconfig="vim ~/.gitconfig"

# git aliases
alias gits="git status"
alias gitd="git diff"
alias gitl="git lg"
alias gita="git add ."
alias gitc="cz commit"

# alias p="pnpm"
# alias pi="pnpm install"
# alias pa="pnpm add"
# alias pad="pnpm add -D"

# exa aliases
alias ls='exa -a --group-directories-first'
alias ll='exa -l --icons --no-user --group-directories-first'
alias la='exa -la --icons --no-user --group-directories-first'

# type sublime . to open current folder in Sublime Text
alias sublime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl --new-window $@"

# load zsh-completions
# autoload -U compinit && compinit

# tabtab source for packages
# uninstall by removing these lines
# [[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

export PATH="/usr/local/sbin:$PATH"


###########################################################
# Post blocks #
###########################################################

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
