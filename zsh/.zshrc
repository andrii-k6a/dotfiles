# Dedupe PATH-like vars. Both the string and array names are needed.
typeset -U PATH path FPATH fpath MANPATH manpath

# --- Homebrew (before Oh My Zsh so its completions are on fpath) --------------
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv zsh)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv zsh)"
fi

# --- PATH & environment ------------------------------------------------------
export PATH="$HOME/.local/bin:$PATH"   # my scripts (tmx, ...)
export PATH="$HOME/go/bin:$PATH"       # go install binaries

export EDITOR="nvim"
export VISUAL="$EDITOR"

# --- Oh My Zsh ---------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""   # the prompt comes from starship
plugins=()

source "$ZSH/oh-my-zsh.sh"

# --- Aliases -----------------------------------------------------------------
[[ -r $HOME/aliases.sh ]] && source "$HOME/aliases.sh"

# --- Shell tools -------------------------------------------------------------
# zsh-autosuggestions: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#homebrew
[[ -r $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] &&
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# fzf: key bindings and fuzzy completion
if (( $+commands[fzf] )); then
  source <(fzf --zsh)
  # Option+C types "ç" on the macOS US layout; bind it to fzf's cd widget.
  # https://github.com/junegunn/fzf/issues/164
  bindkey "ç" fzf-cd-widget
fi

# fnm: Node version manager (switches version on cd)
(( $+commands[fnm] )) && eval "$(fnm env --use-on-cd --shell zsh)"

# zoxide: smarter cd (z, zi)
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"

# starship: prompt
(( $+commands[starship] )) && eval "$(starship init zsh)"

# --- Language runtimes & dev tools -------------------------------------------
# bun
export BUN_INSTALL="$HOME/.bun"
if [[ -d $BUN_INSTALL ]]; then
  [[ -s $BUN_INSTALL/_bun ]] && source "$BUN_INSTALL/_bun"   # completions
  export PATH="$BUN_INSTALL/bin:$PATH"
fi

# deno
[[ -r $HOME/.deno/env ]] && . "$HOME/.deno/env"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
(( $+commands[pyenv] )) && eval "$(pyenv init - zsh)"

# uv completions
(( $+commands[uv] )) && eval "$(uv generate-shell-completion zsh)"

# Rancher Desktop
[[ -d $HOME/.rd/bin ]] && export PATH="$HOME/.rd/bin:$PATH"

# SDKMAN! must come after every other tool that changes PATH; only the local
# overrides and the tmux bootstrap below may follow it.
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s $SDKMAN_DIR/bin/sdkman-init.sh ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# --- Local overrides & tmux --------------------------------------------------
# These are if-blocks on purpose: `[[ ... ]] && source` would leave $? = 1 when the
# file is missing, and starship would draw the first prompt as a failed command.
if [[ -f $HOME/.zshrc.local ]]; then
  source "$HOME/.zshrc.local"
fi

# tmux auto-attach: keep last, it exits this shell when tmux exits.
if [[ -r $HOME/tmux-bootstrap.sh ]]; then
  source "$HOME/tmux-bootstrap.sh"
fi
