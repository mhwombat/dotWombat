PATH=~/.cabal/bin:${PATH}
PATH=~/.local/bin:${PATH}
PATH=~/bin:${PATH}
PATH=~/github/wain-tools:${PATH}

#alias wls='wombat ls'
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
