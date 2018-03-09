function p -d "Project Manager"
	set -l curdir (pwd)
	set -l searching 1

	getopts $argv | while read -l key value
		switch $key
			case s
				set searching 0

				for project in (find ~/Coding -type d -maxdepth 2 -depth 2 -print)
					cd $project
					git status
				end

				cd $curdir
		end
	end

	if test $searching -ne 0
		cd ~/Coding/(find ~/Coding -type d -maxdepth 2 -depth 2 -print | cut -d '/' -f5,6 | fzf --height 40% --reverse -1 -q "$argv[1]")
	end
end
