function __tmux_work_projects
    set config_dir ~/Projects/dotfiles/tmux-sessions

    if test -d $config_dir
        for file in (ls $config_dir/*.conf 2>/dev/null)
            basename $file .conf
        end
    end
end

complete -c work -f

complete -c work --no-files -a "(__tmux_work_projects)"
