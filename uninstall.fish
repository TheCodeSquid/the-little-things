#!/usr/bin/fish

set dir (status dirname)

function thing
    set subdir (path resolve $dir/$argv[1])
    argparse 's=' 'd=' -- $argv

    if set -q _flag_s
        set file $HOME/.local/bin/$_flag_s
        echo "Removing $file"
        rm -f $file
    end

    if set -q _flag_d
        set file $HOME/.local/share/applications/$_flag_d
        echo "Removing $file"
        rm -f $file
    end
end

source $dir/things.fish
