# alias `help` for shell bulitin documentation (like in bash).
#   help echo
#   help pushd
unalias run-help # run-help is initially an alias for `man`?
autoload run-help
HELPDIR=/usr/share/zsh/"${ZSH_VERSION}"/help
alias help=run-help

# aliases related to pushd, popd, and dirs
alias dirl='dirs -v'
alias dirp='dirs -p'
