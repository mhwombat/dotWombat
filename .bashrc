###
### general
###

# bash version check
if ((BASH_VERSINFO[0] < 4))
then 
  echo "You need at least bash-4.0 or some options will not work correctly." 
fi

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

###
### tab completion (readline bindings)
###

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

###
### history
###

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# # Don't record some commands
# export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

# Separate history file for each process
HISTDIR=$XDG_DATA_HOME/bash-history
mkdir -p $HISTDIR
HISTFILE="$HISTDIR/$BASHPID"


# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

###
### prompt
###

export STARSHIP_CONFIG=~/example/non/default/path/starship.toml

eval "$(starship init bash)"

# # Automatically trim long paths in the prompt (requires Bash 4.x)
# PROMPT_DIRTRIM=2

###
### direnv
###

eval "$(direnv hook bash)"

###
### Non-shell-specific stuff
###

source ${XDG_CONFIG_HOME}/shell-agnostic/rc
