#!/bin/bash
tput civis
clear

cols=$(tput cols)
lines=$(tput lines)

l1=" __     _____ ____ _____ ___ ___ ____  _____   _ "
l2=" \ \   / /_ _/ ___|_   _/ _ \_ _|  _ \| ____| | |"
l3="  \ \ / / | | |     | || | | | || |_) |  _|   | |"
l4="   \ V /  | | |___  | || |_| | ||  _ <| |___  |_|"
l5="    \_/  |___\____| |_| \___/___|_| \_\_____| (_)"
                                                 
                                                                                                                                                                                                                                                                                       
msg_height=5
msg_width=${#l1}

start_line=$(( (lines - msg_height) / 2 ))
end_line=$(( start_line + msg_height - 1 ))
start_col=$(( (cols - msg_width) / 2 ))

for ((l=0; l<lines; l++)); do
    
    if (( l >= start_line && l <= end_line )); then
        
        current_msg_line_idx=$(( l - start_line + 1 ))
        line_content_var="l$current_msg_line_idx"
        line_content="${!line_content_var}" 

        left_side=$(( (cols - msg_width) / 2 ))
        right_side=$(( cols - left_side - msg_width ))
        printf "/%.0s" $(seq 1 $left_side)
        printf "\e[1;7m%s\e[0m" "$line_content"
        printf "/%.0s" $(seq 1 $right_side)
    else 
        printf "/%.0s" $(seq 1 $cols)
    fi

    sleep 0.03
done

tput cup $((lines - 1)) 0
tput cnorm
sleep 10
shutdown --poweroff