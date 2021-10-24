###
### Extensions
###
#xontrib load abbrevs argcomplete coreutils kitty

#WELCOME_MSG = ["", "Hello, wombat!", ""]

###
### Paths
###

$PATH.insert(0,'~/.cabal/bin')
$PATH.insert(0,'~/.local/bin')
$PATH.insert(0,'~/bin')
$PATH.insert(0,'~/github-wain-tools')

###
### CD Behaviour
###

# Flag to enable changing to a directory by entering the dirname or full path only
$AUTO_CD=True

###
### Window title
###

$TITLE='{cwd} | xonsh'

###
### Prompt
###

#         '{env_name}{BOLD_GREEN}{user}@{hostname}{BOLD_BLUE} {cwd}{branch_color}{curr_branch: {}}{RESET} {BOLD_BLUE}{prompt_end}{RESET} '
$PROMPT = '{BOLD_GREEN}{cwd}{BOLD_BLUE}{branch_color}{curr_branch: }{RESET} {prompt_end}{RESET} '

###
### Mouse support
###

# # Allows mouse clicking for positioning the cursor or selecting a completion. 
# $MOUSE_SUPPORT=True

###
### User assistance
###

# Auto-insert matching parentheses, brackets, and quotes.
$XONSH_AUTOPAIR=True

###
### History
###

$XONSH_HISTORY_SIZE=(10000, 'commands')

# #setxkbmap ie CloGaelach
# #xinput set-button-map "Logitech USB Trackball" 1 8 3 4 5 6 7 2 9


# # If not running interactively, don't do anything
# [[ $- != *i* ]] && return

###
### Appearance
###
$XONSH_COLOR_STYLE='solarized-light'

# ###
# ### Prompt options
# ###

# #PS1='%~$ '
# #source ~/bin/amy-prompt.sh

# SPACESHIP_PROMPT_SEPARATE_LINE=false

# autoload -U promptinit; promptinit
# prompt spaceship

# # Before each prompt...
# precmd () {
#     # Set window title to current directory and last command
#     print -Pn "\e]0;${PWD/#$HOME/~} [$(history | tail -n1 | awk '{for (i=2;i<=NF-1;i++) printf $i " "; print $NF}')]\a"
# }

# ###
# ### History options
# ###

# # Where to store command history
# mkdir -p ${XDG_CACHE_HOME}/zsh
# HISTFILE=${XDG_CACHE_HOME}/zsh/history

# # Number of lines of history to keep in one session
# HISTSIZE=1000

# # Number of lines of history to save
# SAVEHIST=1000

# # Share history among shells.
# setopt SHARE_HISTORY

# # When there are duplicate commands in history, only keep the last one.
# setopt HIST_IGNORE_ALL_DUPS

# # Remove superfluous blanks from commands before storing in history.
# setopt HIST_REDUCE_BLANKS

###
### Aliases
###

# aliases['longestLine'] = 'awk '\''{ if (length($0) > max) {max = length($0); maxline = $0} } END { print maxline }'\'''
aliases['psgrep'] = r"ps -ef | grep $*"
aliases['hgrep'] = r"history | grep $*"
aliases['ngrep'] = r"notes | grep -i $*"
aliases['cb'] = r"cabal build --ghc-options=-Werror $*"
aliases['cbt'] = r"cabal build --ghc-options=-Werror && cabal test"
aliases['cbti'] = r"cabal build --ghc-options=-Werror && cabal test && cabal install --installdir=."
aliases['cfresh'] = r"cabal check ; cabal outdated ; cabal --disable-nix gen-bounds"
aliases['ffzy'] = r"find ~ -type f | fzy"
aliases['grep-non-ascii'] = r"grep --color='auto' -P -n '[\x80-\xFF]' $*"
aliases['eod'] = r"git-summary ~ ; git-summary ~/github"
aliases['roll'] = r"format-zpl | lpr -P Zebra -o raw"

# function fmd() { find ${1:-.} -name '*.md' | sort ;}
# function searchmd { fmd $2 | xargs grep "$1" ;}
# function fipynb() { find ${1:-.} -name '*.ipynb' | grep -v ipynb_checkpoints | sort ;}
# function searchipynb { fipynb $2 | xargs grep "$1" ;}
# function fhs() { find ${1:-.} -name dist-newstyle -prune -o -name '*.hs' -print | sort ;}
# function searchhs { fhs $2 | xargs grep "$1" ;}
# function idea() { jot -d=${HOME}/github/ideas -t="$*" ;}
# function ideas() { jot -d=${HOME}/github/ideas -p ;}
# function note() { jot -d=${HOME}/github/notes -t="$*" ;}
# function notes() { jot -d=${HOME}/github/notes -p ;}
# function qc() { grep prop_ $* | grep '∷' | sed 's/ ∷.*//; s/\(.*\)/    testProperty "\1"\n      \1,/' ;}
# #function ducks { du -cks "$1"/* |sort -rn |head -11 ;}
# #function snew() { stack new "$1" /home/eamybut/néal/stack/templates/amy.hsfiles ;}
# function nghci() { nix-shell -p "haskellPackages.ghcWithPackages (p: [$*])" --run ghci ;}
