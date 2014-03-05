# Add directories to PATH
export PATH=/opt/local/bin:/opt/local/sbin:~/dropbox/bin:~/bin:$PATH

# Increase size of bash history
HISTFILESIZE=10000

# Add colors to terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# default ======exfxcxdxbxegedabagacad

# Turn on grep coloration
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# Add to grep: color, line numbers, context of 1 line
alias grep="grep --color -n -B 1"
alias grepword="grep -Hnr"
alias grepfiles="grep -l"
alias grepnot="grep -v"

# Change prompt
export PS1="\n\[\e[0;36m\]┌─[\[\e[0m\]\[\e[1;33m\]\u\[\e[0m\]\[\e[1;36m\] @ \[\e[0m\]\[\e[1;33m\]\h\[\e[0m\]\[\e[0;36m\]]─[\[\e[0m\]\[\e[1;34m\]\w\[\e[0m\]\[\e[0;36m\]]\[\e[0;36m\]─[\[\e[0m\]\[\e[0;31m\]\!\[\e[0m\]\[\e[0;36m\]]\[\e[0m\]\n\[\e[0;36m\]└─[\[\e[0m\]\[\e[1;37m\]\$\[\e[0m\]\[\e[0;36m\]]› \[\e[0m\]"

function prompt {
	# set prompt to mac default
	export PS1="\h:\W \u\$ "
	export PS2="> "
	export PS3=""
	export PS4="+ "
}

function prompt1 {
  local BLUE="\[\033[0;34m\]"
  local DARK_BLUE="\[\033[1;34m\]"
  local RED="\[\033[0;31m\]"
  local DARK_RED="\[\033[1;31m\]"
  local NO_COLOR="\[\033[0m\]"
  case $TERM in
    xterm*|rxvt*)
      TITLEBAR='\[\033]0;\u@\h:\w\007\]'
      ;;
    *)
      TITLEBAR=""
      ;;
  esac
  PS1="\u@\h [\t]> "
  PS1="${TITLEBAR}\
  $BLUE\u@\h $RED[\t]>$NO_COLOR "
  PS2='continue-> '
  PS4='$0.$LINENO+ '
}

function prompt2 {
	__cwd3(){
		typeset start=${PWD/${HOME}/\~}
		typeset delete=${start%/*/*/*}
		typeset partial=${start#${delete}/}
		if [[ "${partial}" != /* && "${partial}" != \~* ]]
		then
			partial="/.../${partial}"
		fi
		echo "${partial}"
	}

	PS1="\![\h]\$(__cwd3)> "
}

function prompt3 {
	export PS1='\u@\h [`httpdcount`]> '
}

function prompt4 {
	export PS1='\u@\h \w> '
}

function prompt5 {
	export PS1='\d \h $ '
}

function prompt6 {
	export PS1='[\d \t \u@\h:\w ] $ '
}

function prompt7 {
	# If id command returns zero, you’ve root access.
	if [ $(id -u) -eq 0 ];
	then # you are root, set red color prompt
		PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w #\\[$(tput sgr0)\\]"
	else # normal
		PS1="[\\u@\\h:\\w] $"
	fi
}

function prompt8 {
	PS1="\n\[\e[0;36m\]┌─[\[\e[0m\]\[\e[1;33m\]\u\[\e[0m\]\[\e[1;36m\] @ \[\e[0m\]\[\e[1;33m\]\h\[\e[0m\]\[\e[0;36m\]]─[\[\e[0m\]\[\e[1;34m\]\w\[\e[0m\]\[\e[0;36m\]]\[\e[0;36m\]─[\[\e[0m\]\[\e[0;31m\]\!\[\e[0m\]\[\e[0;36m\]]\[\e[0m\]\n\[\e[0;36m\]└─[\[\e[0m\]\[\e[1;37m\]\$\[\e[0m\]\[\e[0;36m\]]› \[\e[0m\]"
}

function prompt9 {
	export PS1="\e[01;33m# \e[01;35m\D{%A %e %B %G %R %Z} \e[00;31m\u\e[01;32m@\e[00;31m\h \e[01;33m\w :\e[00m\n"
}

function prompt10 {
	PS1='${PWD/????????????????????????????*/...${PWD:${#PWD}-25}} \e7\e[1;1H\w\e[K\e8'
}

function prompt11 {
	PS1='${PWD/????????????????????????????*/...${PWD:${#PWD}-25}} \e7\e[$LINES;1H\w\e[K\e8'
}

function prompt12 {
	PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
}

function prompt13 {
	if [ $(id -u) -eq 0 ];
	then # you are root
		PS1="$PWD #"
	else # normal
		PS1="$PWD $"
	fi
}

# default add color to ls
# G - colorized output
# F - Visual Classification of Files With Special Characters
# a - show hidden files/folders
# l - list format
alias ls="ls -GFalh"
alias sl="ls"

# The 'ls' family
# Add colors for filetype and human-readable sizes by default on 'ls':
alias lk="ls -lSr"   # Sort by size, biggest last
alias lt="ls -ltr"   # Sort by date, most recent last
alias lc="ls -ltcr"  # Sort by/show change time, most recent last
alias lu="ls -ltur"  # Sort by/show access time, most recent last
alias lr="ls -R"     # Recursive ls
alias la="\ls -A"    # Show hidden files
alias ll="\ls -l"    # List
alias l.="ls -d .*"  # Only show hidden files
alias lp="ls -p"     # Show folders

# a couple misc/simple commands
alias c="clear"
alias h="history"
alias cd..="cd .."
alias ..="cd .."
alias vi="vim"

# safe file operations
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias rd="\rm -r"
alias mkdir="mkdir -p"
alias rmdir="rmdir -p"

# prety-print of PATH variable
alias path="echo -e ${PATH//:/\\\n}"

# go back x directories
b(){
	str=""
	count=0
	while [ "$count" -lt "$1" ];
	do
		str=$str"../"
		let count=count+1
	done
	cd $str
}

# make and cd into a directory
function mcd(){
	mkdir -p "$1" && cd "$1";
}

# return line numbers of file
lines(){
	str=""
	IFS=','
	read -a array <<< "$1"
	for element in "${array[@]}"
	do
		str=$str"$element"
	done
	sed -n "$str" "$2"
	unset IFS
}

function glines {
	sed -n "$1" "$2"
}

# search for process
alias tm='ps -ef | grep'
alias psx='ps aux'
alias psr='ps -auroot'
alias psgerst='ps -augerst'

# show which commands you use the most
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

# quick ssh to unc cs server
alias unc='ssh unc'
alias unc2='ssh unc2'
alias unctasks='unc "cat ~/tasks.txt"'

function esc {
	local escaped="'\''"
	echo "${1//\'/$escaped}"
}

function myesc {
	local escaped="\'"
	echo "${1//\'/$escaped}"
}

# email using unc cs mailx
function emailtofunc {
	local message=""
	local file=$3
	if [[ -a "$file" ]]; then
		message="`cat $file`"
		echo "File Sent: $file"
		echo "$message"
		scp $file unc":~/email/tmp.txt"
		unc "emailto '$1' '$2' '$message' 'file'"  
	else
		message="$3"
		echo "Message Sent: $message"
		unc "emailto '$1' '$2' '$message'"  
	fi
}
alias emailto='emailtofunc'

# git aliases
alias ga='git add'
alias ga.='git add .'
alias gaa='git add -A'
alias gu='git pull'
alias gp='git push'
alias gl='git log --color --pretty=format:"%Cgreen%h %Creset %s %Cblueby %an (%ar) %Cred %d" --graph'
alias glp='git log -p --color --pretty=format:"%Cgreen%h %Creset %s %Cblueby %an (%ar) %Cred %d" --graph'
alias gsl='git shortlog -sne'
alias gs='git status'
alias gh='git show --color'
alias gd='git diff --color'
alias gds='git diff --stat --color'
alias gdc='git diff --cached --color'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias grc='git rm --cached'
alias gpu='git pull'
alias gcl='git clone'

# XAMPP Aliases
alias xampp='sudo /applications/xampp/xamppfiles/xampp'

# Misc cURL Utilities
alias ip='curl whatismyip.org'

# HTTP Aliases
alias http='curl http://echo.httpkit.com'
alias http1='http "/path?query=string"'
alias http2='http -i'

function httpdcount {
	ps aux | grep httpd | grep -v grep | wc -l | xargs
}

# CD Aliases
alias cdphil='cd ~/dropbox/school/phil 160'
alias cdphilnotes='cd ~/dropbox/school/phil 160/notes'
alias cdgit='cd ~/Web/Git'
alias cddot='cd ~/Web/Git/dotfiles'
alias cdhack='cd ~/Web/Git/Hackathons'
alias cdwave='cd ~/Web/Git/HnS-Wave/src'
alias cdnetai='cd ~/Web/Git/HnS-Netai/src'
alias cdjs='cd ~/Web/Git/JavaScript'

function directory_to_titlebar {
	local pwd_length=42  # The maximum length we want (seems to fit nicely
			     # in a default length Terminal title bar).

	# Get the current working directory. We'll format it in $dir.
	local dir="$PWD"     

	# Substitute a leading path that's in $HOME for "~"
	if [[ "$HOME" == ${dir:0:${#HOME}} ]]; then
		dir="~${dir:${#HOME}}"
	fi
	
	# Append a trailing slash if it's not there already.
	if [[ ${dir:${#dir}-1} != "/" ]]; then 
		dir="$dir/"
	fi

	# Truncate if we're too long.
	# We preserve the leading '/' or '~/', and substitute
	# ellipses for some directories in the middle.
	if [[ "$dir" =~ (~){0,1}/.*(.{${pwd_length}}) ]]; then  
		local tilde=${BASH_REMATCH[1]}
		local directory=${BASH_REMATCH[2]}
		
		# At this point, $directory is the truncated end-section of the 
		# path. We will now make it only contain full directory names
		# (e.g. "ibrary/Mail" -> "/Mail").
		if [[ "$directory" =~ [^/]*(.*) ]]; then
			directory=${BASH_REMATCH[1]} 
		fi
		
		# Can't work out if it's possible to use the Unicode ellipsis,
		# '…' (Unicode 2026). Directly embedding it in the string does not
		# seem to work, and \u escape sequences ('\u2026') are not expanded.
		#printf -v dir "$tilde/\u2026$s", $directory"
		dir="$tilde/...$directory"
	fi

	# Don't embed $dir directly in printf's first argument, because it's 
	# possible it could contain printf escape sequences.
	printf "\033]0;%s\007" "$dir"
}

if [[ "$TERM" == "xterm" || "$TERM" == "xterm-color" ]]; then
	export PROMPT_COMMAND="directory_to_titlebar"
fi

if [ $UID -ne 0 ]; then
	alias reboot='sudo reboot'
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.bash_passportparking ]; then
	. ~/.bash_passportparking
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

