#!/usr/bin/fish

set dir (status dirname)

function thing
    set subdir (path resolve $dir/$argv[1])
    argparse 's=' 'd=' -- $argv[1..]

    set bin $subdir/$_flag_s

    if set -q _flag_s
        cp $bin $HOME/.local/bin/$_flag_s
    end

    if set -q _flag_d
        set content (cat $subdir/$_flag_d)
        set out $HOME/.local/share/applications/$_flag_d
        string replace '{bin}' $bin $content > $out
    end

    echo "Linked $argv[1]"
end

source $dir/things.fish
