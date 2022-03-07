function ccd 
    mkdir $argv[1] && cd $argv[1]
end

function git
    switch $argv[1]
    case ""
        command git status -sb --show-stash
        return
    case "root"
        cd (git rev-parse --show-toplevel)
        return
    end

    command git $argv
end

function scd 
    if test (count $argv) -eq 1
        cd (fd -t d -H -E .git --search-path $argv[1] | sk)
    else
        cd (fd -t d -H -E .git --search-path $HOME | sk)
    end
end

