function __projects_list
	find ~/Coding -type d -maxdepth 2 -depth 2 -print
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
					git bs
				end

				cd $curdir
				return
		end
	end

	cd ~/Coding/(__projects_list | cut -d '/' -f5,6 | fzf --height 40% --reverse -1 -q "$search")
end
