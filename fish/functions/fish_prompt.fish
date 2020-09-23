function fish_prompt --description 'Informative prompt'
    #Save the return status of the previous command
    set -l last_pipestatus $pipestatus

    switch "$USER"
        case root toor
            printf '%s%s%s# ' (set -q fish_color_cwd_root
                                                             and set_color $fish_color_cwd_root
                                                             or set_color $fish_color_cwd) \
                (prompt_pwd) (set_color normal)
        case '*'
            set -l pipestatus_string (__fish_print_pipestatus "[" "] " "|" (set_color $fish_color_status) \
                                      (set_color --bold $fish_color_status) $last_pipestatus)

            printf '[%s] %s%s %s%s%s \f\r> ' (date "+%H:%M:%S") \
                (set_color $fish_color_cwd) $PWD $pipestatus_string \
                (set_color normal)
    end
end
