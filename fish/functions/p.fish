function p -d "Project Manager"
	cd ~/Coding/(find ~/Coding -type d -maxdepth 2 -depth 2 -print | cut -d '/' -f5,6 | fzf --height 40% --reverse -1 -q "$argv[1]")
end
