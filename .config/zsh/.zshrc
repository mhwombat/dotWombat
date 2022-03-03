# If not running interactively, don't do anything
[[ $- != *i* ]] && return

###
### Prompt options
###

#PS1='%~$ '
source ${XDG_CONFIG_HOME}/zsh/configure-spaceship


# Before each prompt...
precmd () {
    # Set window title to current directory and last command
    lastcmd=$(history | tail -n 1 | cut -c7-999)
    windowtitle="${PWD/#$HOME/~} : ${lastcmd}"
    print -Pn "\e]0;${windowtitle}\a"
}

###
### History options
###

# Where to store command history
mkdir -p ${XDG_CACHE_HOME}/zsh
HISTFILE=${XDG_CACHE_HOME}/zsh/history

# Number of lines of history to keep in one session
HISTSIZE=10000

# Number of lines of history to save
SAVEHIST=10000

# Share history among shells.
setopt SHARE_HISTORY

# When there are duplicate commands in history, only keep the last one.
setopt HIST_IGNORE_ALL_DUPS

# Remove superfluous blanks from commands before storing in history.
setopt HIST_REDUCE_BLANKS

###
### Other options
###

# If the "command" isn't valid, assume it's a directory and try to cd to it.
setopt AUTO_CD

# Suggest spelling corrections for commands.
setopt CORRECT

# Tell me if no files match a pattern.
setopt NOMATCH

# Tell me if I use a bad file matching pattern.
setopt BAD_PATTERN

# Never beep at me.
unsetopt NOMATCH

# I don't need extended wildcards.
unsetopt EXTENDED_GLOB

# Notify me immediately when background jobs finish.
setopt NOTIFY

# When executing a shell function or sourcing a script, set $0 temporarily to the name of the function/script.
setopt FUNCTION_ARGZERO

# Use emacs key bindings for command editing.
bindkey -e

###
### Style control for command completion
###
zstyle :compinstall filename '/home/amy/.zshrc'
autoload -Uz compinit
compinit

###
### Misc
###

# Use zsh instead of bash for nix shells
# any-nix-shell zsh --info-right | source /dev/stdin

# Set up direnv
eval "$(direnv hook zsh)"

###
### Non-shell-specific stuff
###

source ${XDG_CONFIG_HOME}/shell-agnostic/rc
