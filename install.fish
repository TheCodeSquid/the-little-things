#!/usr/bin/fish

set dir (status dirname)

function thing
    set subdir (path resolve $dir/$argv[1])
    argparse 's=' 'd=' -- $argv[1..]

    set script $subdir/$_flag_s
    set desktop $subdir/$_flag_d
    set out $HOME/.local/share/applications/$_flag_d
    set content (cat $desktop)

    string replace '{script}' $script $content > $out

    echo "$desktop -> $out"
end

source $dir/things.fish
