# perform 'ls' after 'cd' if successful
cdls() {
	builtin cd "$*"
	RESULT=$?
	if [ "$RESULT" -eq 0 ]; then
		ls
	fi
}

alias cd='cdls'

