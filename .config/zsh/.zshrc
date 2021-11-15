# If not running interactively, don't do anything
[[ $- != *i* ]] && return

###
### Prompt options
###

#PS1='%~$ '
#source ~/bin/amy-prompt.sh

SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL='$ '
SPACESHIP_CHAR_COLOR_SUCCESS=#b299ff
SPACESHIP_DIR_COLOR=#99ccff
SPACESHIP_GIT_BRANCH_COLOR=#99ffe5
SPACESHIP_GIT_STATUS_COLOR=#ff99b2

autoload -U promptinit; promptinit
prompt spaceship

# Before each prompt...
precmd () {
    # Set window title to current directory and last command
    lastcmd=$(history | tail -n 1 | cut -c7-999)
    windowtitle="${PWD/#$HOME/~} : ${lastcmd}"
    # if [[ ${TERM} = "xterm-kitty" ]]; then
    #     kitty @ set-window-title "${windowtitle}"
    # else
    #     print -Pn "\e]0;${windowtitle}\a"
    # fi
    print -Pn "\e]0;${windowtitle}\a"
    # dircolour=$(amy-prompt.hs)
    # printf "\x1b]11;${dircolour}\x1b\\"
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
SAVEHIST=1000

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

###
### Non-shell-specific stuff
###

#setxkbmap ie CloGaelach
#xinput set-button-map "Logitech USB Trackball" 1 8 3 4 5 6 7 2 9

PATH=~/.cabal/bin:${PATH}
PATH=~/.local/bin:${PATH}
PATH=~/bin:${PATH}
PATH=~/github/wain-tools:${PATH}

# alias wls='wombat ls'
# alias ls='colorls'
alias longestLine='awk '\''{ if (length($0) > max) {max = length($0); maxline = $0} } END { print maxline }'\'''
alias psgrep='ps -ef | grep'
alias hgrep='history | grep'
alias ngrep='notes | grep -i'
alias cb='cabal build --ghc-options=-Werror'
alias cbt='cabal build --ghc-options=-Werror && cabal test'
alias cbti='cabal build --ghc-options=-Werror && cabal test && cabal install --installdir=.'
alias cfresh='cabal check ; cabal outdated ; cabal --disable-nix gen-bounds'
alias ffzy='find ~ -type f | fzy'
alias grep-non-ascii="grep --color='auto' -P -n '[\x80-\xFF]'"
alias eod="git-summary ~ ; git-summary ~/github"
alias roll="format-zpl | lpr -P Zebra -o raw"

function fmd() { find ${1:-.} -name '*.md' | sort ;}
function searchmd { fmd $2 | xargs grep "$1" ;}
function fipynb() { find ${1:-.} -name '*.ipynb' | grep -v ipynb_checkpoints | sort ;}
function searchipynb { fipynb $2 | xargs grep "$1" ;}
function fhs() { find ${1:-.} -name dist-newstyle -prune -o -name '*.hs' -print | sort ;}
function searchhs { fhs $2 | xargs grep "$1" ;}
function idea() { jot -d=${HOME}/github/ideas -t="$*" ;}
function ideas() { jot -d=${HOME}/github/ideas -p ;}
function note() { jot -d=${HOME}/github/notes -t="$*" ;}
function notes() { jot -d=${HOME}/github/notes -p ;}
function qc() { grep prop_ $* | grep '∷' | sed 's/ ∷.*//; s/\(.*\)/    testProperty "\1"\n      \1,/' ;}
#function ducks { du -cks "$1"/* |sort -rn |head -11 ;}
#function snew() { stack new "$1" /home/eamybut/néal/stack/templates/amy.hsfiles ;}
function nghci() { nix-shell -p "haskellPackages.ghcWithPackages (p: [$*])" --run ghci ;}
