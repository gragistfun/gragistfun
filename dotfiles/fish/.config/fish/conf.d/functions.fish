function ccd 
    mkdir $argv[1] && cd $argv[1]
end

function scd 
    if test (count $argv) -eq 1
        cd (fd -t d -H -E .git --search-path $argv[1] | sk)
    else
        cd (fd -t d -H -E .git --search-path $HOME | sk)
    end
end

