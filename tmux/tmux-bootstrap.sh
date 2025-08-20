if [[ -t 1 ]] && command -v tmux &> /dev/null && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ] && [ -z "$VSCODE_INJECTION" ] && [ -z "$TERMINAL_EMULATOR" ]; then
	tmux a || tmux new -s default
	exit
fi
