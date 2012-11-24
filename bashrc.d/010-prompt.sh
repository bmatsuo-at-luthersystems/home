prompt_base='${debian_chroot:+($debian_chroot)}'

# Handle colored prompt setup.
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
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
    PS1="$prompt_base"'\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1="$prompt_base"'\u@\h:\w\$ '
fi
env_unset="color_prompt:force_color_prompt:$env_unset"

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    case "$PLATFORM" in
        Linux)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1";;
    esac
    ;;
*)
    ;;
esac

unset prompt_base