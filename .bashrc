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
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

color_prompt=yes

# print the git branch name if in a git project
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# set the input prompt symbol
ARROW="->"

# define text formatting
PROMPT_BOLD="$(tput bold)"
PROMPT_FG_BLACK="$(tput setaf 0)"
PROMPT_FG_RED="$(tput setaf 1)"
PROMPT_FG_GREEN="$(tput setaf 2)"
PROMPT_FG_YELLOW="$(tput setaf 3)"
PROMPT_FG_BLUE="$(tput setaf 4)"
PROMPT_FG_MAGENTA="$(tput setaf 5)"
PROMPT_FG_PINK="$(tput setaf 213)"
PROMPT_RESET="$(tput sgr0)"

PROMPT_SECTION_USERNAME="\[$PROMPT_BOLD$PROMPT_FG_GREEN\]\h\[$PROMPT_RESET\]"
PROMPT_SECTION_DIRECTORY="\[$PROMPT_BOLD$PROMPT_FG_BLUE\]\W\[$PROMPT_RESET\]"
PROMPT_SECTION_GIT_BRANCH="\[$PROMPT_FG_YELLOW\]\`parse_git_branch\`\[$PROMPT_RESET\]"
PROMPT_SECTION_ARROW="\[$PROMPT_BOLD$PROMPT_FG_GREEN\]$ARROW\[$PROMPT_RESET\]"


if [ "$color_prompt" = yes ]; then
	PS1="$PROMPT_SECTION_DIRECTORY$PROMPT_SECTION_GIT_BRANCH $PROMPT_SECTION_ARROW "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h:\w\a\]$PS1"
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

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

# map cd into cd + ls
function cd {
    builtin cd "$@" && ls -F
}

function mkcd {
    command mkdir "$1" && cd "$1"
}

# change title of tab
set-title(){
    ORIG=$PS1
    TITLE="\e]2;$@\a"
    PS1=${ORIG}${TITLE}
}
clean-tmp(){
	command find . -type f -name "*.sw[op]" -exec mv -t /tmp {} +
	command find . -type f -name "*.tmp" -exec mv -t /tmp {} +
}

function git-test-pull {
	command git fetch origin pull/"$1"/head:pull"$1"
}

function tvi {
	command gnome-terminal --geometry 90x60+2250+0 -- vi $@
}

function countdown(){
   date1=$((`date +%s` + $1));
   while [ "$date1" -ge `date +%s` ]; do
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}

function stopwatch(){
  date1=`date +%s`;
   while true; do
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
    sleep 0.1
   done
}

function man() {
  /usr/bin/man $* | \
    col -b | \
    vim -R -c 'set ft=man nomod nolist' -
}

function info() {
  /usr/bin/info $* | \
    col -b | \
    vim -R -c 'set ft=man nomod nolist' -
}

function csbuild() {
	echo "Search for files in dirs: $(pwd) $@"
	if [[ $USE_GIT -eq 1 ]]; then
		find . $@ -regex ".*\.\(h\|c\|cc\|cpp\)" ! -type l -exec sh -c '
			for f do
				git check-ignore -q "$f" ||
				echo $f
			done
		' find-sh {} + > cscope.files
	else
		echo Excluding $(find . -maxdepth 1 -name "build*")
		find . $@ -regex ".*\.\(h\|c\|cc\|cpp\)" ! -type l ! -path "./build*"> cscope.files
	fi
	echo "Building cscope db..."
	cscope -Rbkq
}

function pretty_csv {
    column -t -s, -n "$@" | less -F -S -X -K
}

# Grep ignoring submodules
function rgnosm {
	rg $@ `git config --file .gitmodules --get-regexp path | awk '{ print $2 }' | xargs -I {} echo -g \'\!{}\'|xargs`
}

# join to tmux session on server `$1`
function j {
	local sess_name="vf"
	local server=$1

	ssh $server -t "tmux a -t $sess_name || tmux new -s $sess_name"
}

# create new ssh key without asking questions
function newkey {
	ssh-keygen -t rsa -N "" -f ~/.ssh/id_ed25519
}

export CARGO_TARGET_DIR=~/.cargo-target
