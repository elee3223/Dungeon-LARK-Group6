#!/bin/bash

# set color variables
BG_CYAN="$(tput setab 6)"
BG_BLACK="$(tput setab 0)"
FG_GREEN="$(tput setaf 2)"
FG_MAGENTA="$(tput setaf 5)"

function resetVar() {
        echo "Resetting Lark environment for new game, $userName "
        sleep 2
        # reset variables
}

#save screen
tput smcup

# display mennu until selection == 0
while [[ $selection != 0 ]]
        do
                echo -n ${BG_CYAN} ${FG_MAGENTA}
                clear
                cat <<EOF
                             Please Select:

                        1. Log into Lark game
                        2. Start Lark game script
                        0. Quit
EOF


                read -p "Enter selection [0-2] > " selection

                #clear area beneat menu
                tput cup 10 0 #positions the cursor
                echo -n ${BG_BLACK}${FG_GREEN}
                tput ed #clears cursor to end of line
                tput cup 11 0

                #Act on selection
                case $selection in
                        1) read -p "What is your name? " userName
                                if [ $(gawk '{print $1}' ./currentPlayer.dat) = $userName ]
                                        then
                                                echo "Welcome back $userName"
                                                sleep 2
                                        else
                                                echo $userName > ./currentPlayer.dat
                                                new=true
                                fi
                                ;;
                        2)  if [ new ]
                                 then resetVar # resets game variables and settings
                                 echo " Welcome to Lark" 
                                 echo ""

                                echo "let's make a backpack! Make a file by typing touch inventory"

                                read -p "" bag
                                while [ "$bag" != "touch inventory" ]
                                do
                                        echo "That's not the right syntax, try again"
                                        read -p "" bag
                                done

                                touch inventory

                                echo "type cat dungeon to see your surroundings as your proceed through the dungeon."

                                echo "let's enter the dungeon! we will be moving through by changing directories, or cd. cd to corridor_1"
                                echo "make sure to bring your backpack with you! mv inventory corridor_1/inventory"   
                                printf "\n\nPress any key to continue"
                                read -n 1
                                 fi
                                # run start up script
                                echo "Lark is starting now $userName"; sleep 1
                                #source ./someLarkStartScript
                                break
                                ;;
                        0)  break
                            ;;
                        *)  echo "Invalid entry."
                            ;;
esac

printf "\n\nPress any key to continue"
read -n 1
done

#Restore saved screen
tput rmcup
echo "program terminated."

                                                                              
