if [[ -t 1 ]] && command -v tmux &> /dev/null && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ] && [ "$TERM_PROGRAM" != "vscode" ] && [ "$TERM_PROGRAM" != "Orca" ] && [ -z "$TERMINAL_EMULATOR" ]; then
	tmux a || tmux new -s default
	exit
fi
