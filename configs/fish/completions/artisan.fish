function __artisan_find
    set dir (pwd)
    while test "$dir" != /
        if test -f "$dir/artisan"
            echo "$dir/artisan"
            return 0
        end
        set dir (dirname "$dir")
    end
    return 1
end

function __artisan_commands
    set artisan_path (__artisan_find)
    if test -z "$artisan_path"
        return
    end

    # Jalankan hanya jika artisan bisa dieksekusi
    php $artisan_path --no-ansi --raw list ^ /dev/null |
        string split \n |
        string match -r '^[a-zA-Z0-9:\-]+' |
        string trim
end

complete -c artisan -f -a "(__artisan_commands)"
