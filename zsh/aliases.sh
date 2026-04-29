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
