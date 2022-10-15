function ccd 
    mkdir $argv[1] && cd $argv[1]
end

function git
    switch $argv[1]
    case ""
        command git status
        return
    case "root"
        set -l root (git rev-parse --show-toplevel 2> /dev/null) 
        if test -n "$root"
            cd "$root"
        end
        return
    case "sroot" "super-root"
        set -l sroot (git rev-parse --show-superproject-working-tree 2> /dev/null) 
        if test -n "$sroot"
            cd "$sroot"
        end
        return
    end

    command git $argv
end

function scd 
    if test (count $argv) -eq 1
        set dir (fd -t d -H -E .git --search-path "$argv[1]" | sk 2> /dev/null)
    else
        set dir (fd -t d -H -E .git | sk 2> /dev/null)
    end

    if test -n "$dir"
        cd "$dir"
    end
end

