#!/usr/bin/fish

set dir (status dirname)

function thing
    set subdir (path resolve $dir/$argv[1])
    argparse 's=' 'd=' -- $argv

    set file $HOME/.local/share/applications/$_flag_d
    echo "Removing $file"
    rm -f $file
end

source $dir/things.fish
