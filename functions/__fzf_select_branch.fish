function __fzf_select_branch -d "Select git branch checkout"
    commandline | read -l buffer
    git branch | sed 's/^\*/ /' | awk '{ print $1 }' | fzf | read -l line
    if [ $line ]
        git checkout "$buffer$line"
    end
    commandline -f repaint
end
