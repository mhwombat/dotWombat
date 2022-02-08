keys.txt : config
	grep bindsym $^ | grep -v '^ *#' | sed 's/ *bindsym //; s/ */,/; s/"//g; s/warning -m.*//; 1ikey,action' | csvlook >$@
