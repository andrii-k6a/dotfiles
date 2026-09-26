vim() {
    if [[ $# -eq 0 ]]; then
        nvim .
    else
        nvim "$@"
    fi
}
alias lsd="lsd -1X"
alias zshconfig="vim ~/.zshrc"
alias g="git"
alias oc="opencode"

pa() {
    local aliases_link repo_root assistant_prompt
    aliases_link="$(readlink "$HOME/aliases.sh")" || {
        print -u2 "~/aliases.sh is not a symlink; cannot locate the dotfiles repo."
        return 1
    }
    repo_root="$(cd "$(dirname "$aliases_link")/.." && pwd)"
    assistant_prompt="$repo_root/pi/assistant.md"
    [[ -f "$assistant_prompt" ]] || {
        print -u2 "Missing Pi assistant prompt: $assistant_prompt"
        return 1
    }
    command pi \
        --append-system-prompt "$assistant_prompt" \
        --session-dir "$HOME/.pi/agent/assistant-sessions" \
        "$@"
}

tmxhere() {
    tmx "$PWD"
}

# Switch AWS profile via fzf picker; auto-runs `aws sso login` if cached SSO token is expired/missing.
aws-use() {
    local profile
    profile=$(aws configure list-profiles | fzf) || return 0
    export AWS_PROFILE="$profile"
    aws sts get-caller-identity >/dev/null 2>&1 || aws sso login
    echo "✅ AWS_PROFILE=$AWS_PROFILE"
}
