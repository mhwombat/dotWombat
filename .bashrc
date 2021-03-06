# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#
# Amy's customisations
#

# Needed by gpg-agent, which is used by stack upload
GPG_TTY=$(tty)
export GPG_TTY

#setxkbmap ie CloGaelach
#xinput set-button-map "Logitech USB Trackball" 1 8 3 4 5 6 7 2 9

PATH=~/.cabal/bin:${PATH}
PATH=~/.local/bin:${PATH}
PATH=~/bin:${PATH}
PATH=~/wain-tools:${PATH}

source amy-prompt.sh

#alias wls='wombat ls'
alias longestLine='awk '\''{ if (length($0) > max) {max = length($0); maxline = $0} } END { print maxline }'\'''
alias psgrep='ps -ef | grep'
alias hgrep='history | grep'
alias ngrep='notes | grep -i'
alias cb='cabal v2-build --ghc-options=-Werror'
alias cbt='cabal v2-build --ghc-options=-Werror && cabal v2-test'
alias cbti='cabal v2-build --ghc-options=-Werror && cabal v2-test && cabal v2-install --installdir=.'
# alias cc='cabal --enable-nix v2-configure --enable-tests'
# alias cb='cabal --enable-nix v2-build --ghc-options=-Werror'
# alias cbt='cabal --enable-nix v2-build --ghc-options=-Werror && cabal --enable-nix v2-test'
# alias cbti='cabal --enable-nix v2-build --ghc-options=-Werror && cabal --enable-nix v2-test && cabal --enable-nix v2-install'
#alias cidt='cabal --enable-nix install --dependencies-only --enable-tests'
#alias ghcis='ghcs --interactive'
#alias mirror='xrandr --output DP2 --primary --same-as eDP1 --output eDP1 --auto'
#alias dual='xrandr --output DP2 --primary --right-of eDP1 --output eDP1 --auto'
#alias meldit='meld ~/néal/${PWD##*/} .'
#alias sbuild='stack build --ghc-options=-Werror'
alias sclean='rm -rf .stack-work && stack clean'
alias sbuild='stack build --pedantic'
alias stest='stack test --pedantic'
alias gs='~/src/git-summary/git-summary ~; ~/src/git-summary/git-summary ~/src'
alias ffzy='find ~ -type f | fzy'
alias maths='python3 -m http.server --directory ~/github/eolas/maths'
alias grep-non-ascii="grep --color='auto' -P -n '[\x80-\xFF]'"
alias cookiecutter="nix-shell -p cookiecutter git --run 'cookiecutter gh:utdemir/hs-nix-template'"
alias eod="git-summary ~ ; git-summary ~/github"

function fmd() { find ${1:-.} -name '*.md' ;}
function searchmd { fmd $2 | xargs grep "$1" ;}
function fipynb() { find ${1:-.} -name '*.ipynb' | grep -v ipynb_checkpoints ;}
function searchipynb { fipynb $2 | xargs grep "$1" ;}
function fhs() { find ${1:-.} -name .stack-work -prune -o -name '*.hs' -print ;}
function searchhs { fhs $2 | xargs grep "$1" ;}
function idea() { jot -d=${HOME}/github/ideas -t="$*" ;}
function ideas() { jot -d=${HOME}/github/ideas -p ;}
function note() { jot -d=${HOME}/github/notes -t="$*" ;}
function notes() { jot -d=${HOME}/github/notes -p ;}
function qc() { grep prop_ $* | grep '∷' | sed 's/ ∷.*//; s/\(.*\)/    testProperty "\1"\n      \1,/' ;}
#function ducks { du -cks "$1"/* |sort -rn |head -11 ;}
#function snew() { stack new "$1" /home/eamybut/néal/stack/templates/amy.hsfiles ;}

# Turn off the #@£*! bell
set bell-style none
xset b off
#setterm -blength 0

PRINTER=Pull_Print_Unix
LPDEST=Pull_Print_Unix

if [ `hostname` == "lemur" ]; then
    source ~/.nix-profile/etc/profile.d/nix.sh
fi

