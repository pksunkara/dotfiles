function ford -d "Run command for each subdirectory"
  for dir in (ls -d */)
    cd $dir
    eval $argv
    cd -
  end
end
