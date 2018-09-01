function fish_prompt
	set -l status_color green

	if test $status -ne 0
		set status_color red
	end

	set -l start (set_color $status_color)"● "
	set -l folder (set_color cyan)(pwd | sed "s|$HOME|⌂|" | sed "s|⌂/Coding|⍴|")" "

	set -l is_git_repo (command git rev-parse --is-inside-work-tree ^/dev/null)
	set -l have_commits (command git log --oneline -n 1 ^/dev/null)
	set -l branch ""
	set -l git_dirty ""
	set -l git_stash ""
	set -l git_local ""

	if test -n "$is_git_repo" -a -z "$have_commits"
		set branch (set_color red)"(empty) "
	else if test -n "$is_git_repo"
		set git_branch_name (command git symbolic-ref --short HEAD ^/dev/null; or command git show-ref --head -s --abbrev | head -n1 ^/dev/null)
		set branch (set_color yellow)$git_branch_name

		set -l is_git_dirty (command git status --porcelain --ignore-submodules ^/dev/null)
		set git_dirty " "

		set -l git_upstream_branch_name (command git bu ^/dev/null)

		set -l git_stash_count (command git st)

		if test -n "$is_git_dirty"
			set git_dirty "☭  "
		end

		if test $git_stash_count -ne 0
			set git_stash " $git_stash_count≡ "
		end

		if test -n "$git_upstream_branch_name" -a "$git_upstream_branch_name" != "@{u}"
			set -l git_behind_count (command git behind)
			set -l git_ahead_count (command git ahead)

			if test $git_behind_count -ne 0 -a $git_ahead_count -ne 0
				set git_local " $git_behind_count⇵$git_ahead_count "
			else if test $git_behind_count -ne 0
				set git_local " $git_behind_count↓ "
			else if test $git_ahead_count -ne 0
				set git_local " $git_ahead_count↑ "
			end
		else
			set git_local " ⇵ "
		end
	end

	echo $start$folder$branch$git_local$git_stash$git_dirty(set_color brblack)"→ "(set_color normal)
end
