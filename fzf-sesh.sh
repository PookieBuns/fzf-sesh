__fzf_sesh_list_with_icon_cmd="sesh list -i"

_fzf_sesh_list_with_icons() {
	eval $__fzf_sesh_list_with_icon_cmd
}

_fzf_sesh_fzf_sesh_list() {
	_fzf_sesh_list_with_icons | fzf --ansi
}

_fzf_sesh_fzf_sesh_list_tmux() {
	_fzf_sesh_list_with_icons | fzf-tmux -p 55%,60% --ansi \
		--no-sort --border-label ' sesh ' --prompt '⚡  ' \
		--header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
		--bind 'tab:down,btab:up' \
		--bind "ctrl-a:change-prompt(⚡  )+reload($__fzf_sesh_list_with_icon_cmd)" \
		--bind "ctrl-t:change-prompt(🪟  )+reload($__fzf_sesh_list_with_icon_cmd -t)" \
		--bind "ctrl-g:change-prompt(⚙️  )+reload($__fzf_sesh_list_with_icon_cmd -c)" \
		--bind "ctrl-x:change-prompt(📁  )+reload($__fzf_sesh_list_with_icon_cmd -z)" \
		--bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
		--bind "ctrl-d:execute(tmux kill-session -t {2})+change-prompt(⚡  )+reload($__fzf_sesh_list_with_icon_cmd)"
}

_fzf_sesh_extract_path_from_icon_path() {
	echo $1 | awk '{print $2}'
}

fzf_sesh() {
	local sesh_list_cmd="_fzf_sesh_fzf_sesh_list"
	if [ -n "$TMUX" ]; then
		sesh_list_cmd="_fzf_sesh_fzf_sesh_list_tmux"
	fi
	command sesh connect $(_fzf_sesh_extract_path_from_icon_path "$(eval $sesh_list_cmd)")
}

sesh() {
	if [ "$FZF_SESH_REPLACE_SESH_CMD" = "true" ]; then
		if [[ -z "$1" ]] || [[ "$1" == "connect" && -z "$2" ]]; then
			fzf_sesh "$@"
		else
			command sesh "$@"
		fi
	else
		command sesh "$@"
	fi
}
