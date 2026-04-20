#!/bin/bash
sleep 120
if score < 
    echo "Indice N°1 : Vous devriez jetez un œil au site…
    Indice Rappel : En cas de besoin utilisé "help" afin de retrouver toutes les commandes utilisables!"
else
    continue
fi

sleep 120
if score < 
    echo "Indice N°2 : Soyez curieux. Aller voir ce qu'il se trouve là bas…
    Indice Rappel : En cas de besoin utilisé "help" afin de retrouver toutes les commandes utilisables!"
else
    continue
fi

sleep 120
if score < 
    echo "Indice N°3 : Mince, le MDP n'est pas clair. Il ne me fait penser à quelqu'un de cité dans les articles.
    Indice Rappel : En cas de besoin utilisé "help" afin de retrouver toutes les commandes utilisables!"
else
    continue
fi

sleep 120
if score < 
    echo "Indice N°4 : Maintenant je devrais pourvoir me connecter à un certain compte.
    Indice Rappel : En cas de besoin utilisé "help" afin de retrouver toutes les commandes utilisables!"
else
    continue
fi

sleep 120

if score < 5; then
    echo "Indice N°5 : Quelle est la commande pour kill un processus déjà ?
    Indice Rappel : En cas de besoin utilisé "help" afin de retrouver toutes les commandes utilisables!"
else 
    continue
fi 
sleep 30
tput civis
clear

cols=$(tput cols)
lines=$(tput lines)

l1=" __     _____  _   _ ____       ___     _______ _____  ____  _____ ____  ____  _   _ "
l2=" \ \   / / _ \| | | / ___|     / \ \   / / ____|__  / |  _ \| ____|  _ \|  _ \| | | |"
l3="  \ \ / / | | | | | \___ \    / _ \ \ / /|  _|   / /  | |_) |  _| | |_) | | | | | | |"
l4="   \ V /| |_| | |_| |___) |  / ___ \ V / | |___ / /_  |  __/| |___|  _ <| |_| | |_| |"
l5="    \_/  \___/ \___/|____/  /_/   \_\_/  |_____/____| |_|   |_____|_| \_\____/ \___/ "
                                                                                                                                                                                                     
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
sleep 5
shutdown --poweroff