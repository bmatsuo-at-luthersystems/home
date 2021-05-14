##### VIM STUFF
bindkey '\e' vi-cmd-mode 

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1 

function zle-line-init zle-keymap-select {         
  RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"    
  RPS2=$RPS1    
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
