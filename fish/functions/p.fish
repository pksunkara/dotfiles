function __projects_list
	fd '.*' ~/Coding --max-depth 2 --min-depth 2 --type d
end

function p -d "Project Manager"
	set -l curdir (pwd)
	set -l search ""

	getopts $argv | while read -l key value
		switch $key
			case _
				set search $value
				break

			case s
				for project in (__projects_list)
					cd $project
					# TODO: Branches and their statuses
				end

				cd $curdir
				return
		end
	end

	cd ~/Coding/(__projects_list | cut -d '/' -f5,6 | fzf --height 40% --reverse -1 -q "$search")
end
