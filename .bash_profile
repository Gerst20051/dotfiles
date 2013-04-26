# Add directories to PATH
export PATH=$PATH:~/dropbox/bin

# Add colors to terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# default ======exfxcxdxbxegedabagacad

# Increase size of bash history
HISTFILESIZE=2500

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

# add to grep: color, line numbers, context of 1 line
alias grep="grep --color -n -B 1"

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

alias glines='sed -n "$1" "$2"'

# search for process
alias tm='ps -ef | grep'

# show which commands you use the most
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

# quick ssh to unc cs server
alias unc='ssh gerst@login.cs.unc.edu'
alias unctasks='unc "cat ~/tasks.txt"'

# git aliases
alias ga='git add'
alias ga.='git add .'
alias gu='git pull'
alias gp='git push'
alias gl='git log --pretty=format:"%Cgreen%h %Creset %s %Cblueby %an (%ar) %Cred %d" --graph'
alias gs='git status'
alias gh='git show \$1 --color'
alias gd='git diff --color'
alias gds='git diff --stat --color'
alias gdc='git diff --cached --color'
alias gm='git commit -m'
alias gma='git commit -am'
# alias gc='git commit -am \$1'
alias gb='git branch'
# alias gb='git branch \$1'
alias gc='git checkout'
alias gco='git checkout \$1'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'

# HTTP Aliases
alias http='curl http://echo.httpkit.com'
alias http1='http "/path?query=string"'
alias http2='http -i'

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
