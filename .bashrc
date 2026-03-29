# Bash completions
source /etc/bash_completion 2>/dev/null
source <(kubectl completion bash) 2>/dev/null
source <(helm completion bash) 2>/dev/null
source <(stern --completion bash) 2>/dev/null

# Aliases
alias k='kubectl'
alias kns='kubectl config set-context --current --namespace'
alias kctx='kubectl config use-context'
alias tf='tofu'
alias ll='ls -lah --color=auto'

# Prompt showing current kube context + namespace
__kube_ps1() {
    local ctx ns
    ctx=$(kubectl config current-context 2>/dev/null) || return
    ns=$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)
    echo "[${ctx}${ns:+|${ns}}]"
}

export PS1='\[\e[1;34m\]$(__kube_ps1)\[\e[0m\] \[\e[1;32m\]\w\[\e[0m\] \$ '
