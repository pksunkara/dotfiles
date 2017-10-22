function fish_prompt
	set -l status_color green

	if test $status -ne 0
		set status_color red
	end

	set -l start (set_color $status_color)"● "
	set -l folder (set_color cyan)(pwd | sed "s|$HOME|⌂|" | sed "s|⌂/Coding|⍴|")" "

	set -l is_git_repo (command git rev-parse --is-inside-work-tree ^/dev/null)
	set -l branch ""
	set -l git_dirty ""

	if test -n "$is_git_repo"
		set git_branch_name (command git symbolic-ref --short HEAD ^/dev/null; or command git show-ref --head -s --abbrev | head -n1 ^/dev/null)
		set branch (set_color yellow)$git_branch_name

		set -l is_git_dirty (command git status --porcelain --ignore-submodules ^/dev/null)
		set git_dirty " "

		if test -n "$is_git_dirty"
			set git_dirty "☭  "
		end
	end

	echo $start$folder$branch$git_dirty(set_color brblack)"→ "(set_color normal)
end
