function fish_prompt
    set -l current_user (whoami)
    set -l current_dir (prompt_pwd)
    
    set_color cyan
    echo -n "$current_user "
    
    set_color normal
    echo -n "@AppData\\Roaming\\Microsoft\\Windows\\Recent\\sixseven.lnk "
    
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
