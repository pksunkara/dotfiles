function fish_prompt
	set -l status_color green

	if test $status -ne 0
		set status_color red
	end

	set -l start (set_color $status_color)"● "
	set -l folder (set_color cyan)(pwd | sed "s|$HOME|⌂|" | sed "s|⌂/Coding|⍴|")" "

	set -l is_git_repo (command git rev-parse --is-inside-work-tree 2>/dev/null)
	set -l have_commits (command git log --oneline -n 1 2>/dev/null)
	set -l branch ""
	set -l git_dirty ""
	set -l git_stash ""
	set -l git_local ""

	set -l lang ""
	set -l lang_version ""
	set -l language ""

	if test -e package.json
		if type -q node
			set lang ""
			set lang_version (node --version | sed -E "s/v//")
		end
	end

	if test -e Cargo.toml
		set lang ""
		set lang_version (rustup show active-toolchain | cut -d' ' -f1 | sed -E "s/-.*//")
	end

	if test -e mix.exs
		set lang ""
		set lang_version (elixir -v | sed -n '3,/^$/p' | sed -E -e "s/.*Elixir //" -e "s/ .*//")
	end

	if test -n "$is_git_repo" -a -z "$have_commits"
		set branch (set_color brmagenta)" ("(set_color yellow)"empty"(set_color brmagenta)")"
		set git_dirty " "
	else if test -n "$is_git_repo"
		set git_branch_name (command git symbolic-ref --short HEAD 2>/dev/null; or command git show-ref --head -s --abbrev | head -n1 2>/dev/null)
		set branch (set_color brmagenta)" ("(set_color red)$git_branch_name(set_color brmagenta)")"

		set -l is_git_dirty (command git status --porcelain --ignore-submodules 2>/dev/null)
		set git_dirty " "

		set -l git_upstream_branch_name (command git bu 2>/dev/null)

		set -l git_stash_count (command git st)

		if test -n "$is_git_dirty"
			set git_dirty " 華"
		end

		if test $git_stash_count -ne 0
			set git_stash " $git_stash_count≡"
		end

		if test -n "$git_upstream_branch_name" -a "$git_upstream_branch_name" != "@{u}"
			set -l git_behind_count (command git behind)
			set -l git_ahead_count (command git ahead)

			if test $git_behind_count -ne 0 -a $git_ahead_count -ne 0
				set git_local " $git_behind_count⇵$git_ahead_count"
			else if test $git_behind_count -ne 0
				set git_local " $git_behind_count↓"
			else if test $git_ahead_count -ne 0
				set git_local " $git_ahead_count↑"
			end
		else
			set git_local " ⇵"
		end
	end

	if test -n $lang
		set language (set_color brmagenta)$lang" ("(set_color red)$lang_version(set_color brmagenta)") "
	end

	echo $start$folder$language$branch(set_color yellow)$git_local$git_stash$git_dirty(set_color brblack)"→"(set_color normal)" "
end
