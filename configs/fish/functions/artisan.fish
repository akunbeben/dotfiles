function _artisan_find
    set dir (pwd)
    while test "$dir" != "/"
        if test -f "$dir/artisan"
            echo "$dir/artisan"
            return 0
        end
        set dir (dirname "$dir")
    end
    return 1
end

function _docker_compose_cmd
    if command -q "docker compose"
        echo "docker compose"
    else
        echo "docker-compose"
    end
end

function artisan
    set artisan_path (_artisan_find)

    if test -z "$artisan_path"
        echo "fish-artisan: artisan not found. Are you in a Laravel directory?" >&2
        return 1
    end

    set laravel_path (dirname "$artisan_path")
    set docker_compose_config_path (find $laravel_path -maxdepth 1 \( -name "docker-compose.yml" -o -name "docker-compose.yaml" \) | head -n1)
    set artisan_cmd ""

    if test -z "$docker_compose_config_path"
        set artisan_cmd "php $artisan_path"
    else
        if grep "laravel/sail" "$docker_compose_config_path" | head -n1 | read -l dummy_var
            set artisan_cmd "$laravel_path/vendor/bin/sail artisan"
        else
            set docker_compose_cmd (_docker_compose_cmd)
            set docker_compose_service_name (eval $docker_compose_cmd ps --services 2>/dev/null | grep -E 'app|php|api|workspace|laravel\.test|webhost' | head -n1)
            if test -n "$docker_compose_service_name"
                if test -t 1
                    set artisan_cmd "$docker_compose_cmd exec $docker_compose_service_name php artisan"
                else
                    set artisan_cmd "$docker_compose_cmd exec -T $docker_compose_service_name php artisan"
                end
            else
                echo "fish-artisan: No running container found. Start Docker or Sail." >&2
                return 1
            end
        end
    end

    set artisan_start_time (date +%s)

    eval $artisan_cmd $argv
    set artisan_exit_status $status

    if test -n "$argv[1]"; and string match -q -r '^make:' "$argv[1]"; and test -n "$ARTISAN_OPEN_ON_MAKE_EDITOR"
        find \
            "$laravel_path/app" \
            "$laravel_path/tests" \
            "$laravel_path/database" \
            -type f \
            -newermt "-"(math (date +%s) - $artisan_start_time + 1)" seconds" \
            -exec $ARTISAN_OPEN_ON_MAKE_EDITOR {} \; 2>/dev/null
    end

    return $artisan_exit_status
end
