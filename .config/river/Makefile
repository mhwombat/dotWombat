keys.txt : init
	grep 'riverctl map' init | grep -v '^ *#' | sed "s/ *riverctl map //; s/ /,'/; s/ # /','/; s/$$/'/; 1imode,key,action" | csvlook >$@
