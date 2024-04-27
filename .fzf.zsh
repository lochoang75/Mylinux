# Setup fzf
# ---------
if [[ ! "$PATH" == */home/elliot/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/elliot/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/elliot/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/elliot/.fzf/shell/key-bindings.zsh"

export FZF_DEFAULT_OPTS='
	--height 40% --multi --layout=reverse --border
	--bind ctrl-f:page-down,ctrl-b:page-up
	--preview "head -100 {}"
'
