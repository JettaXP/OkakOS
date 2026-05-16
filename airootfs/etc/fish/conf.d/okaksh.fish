fish_add_path ~/.local/bin
if status is-interactive
    set fish_greeting
    function fish_prompt
        set -l current_user (whoami)
        set -l current_dir (prompt_pwd)
        set -l current_host (hostname)
        set_color cyan
        echo -n "$current_user"
        set_color normal
        echo -n "@"
        set_color green
        echo -n "$current_host "
        set_color yellow
        echo -n "$current_dir "
        set_color normal
        echo -n "> "
    end
    function fish_command_not_found
        set_color red
        echo "Poshel nahuuy kozel 🤝" >&2
        set_color normal
    end
end
