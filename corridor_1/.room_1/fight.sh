#!/bin/bash

opponent_hp=10

echo "water fire-wall inventory"
echo""

 water() {
 if [[ "$1" = "fire-wall" ]]
         then
                 if grep -Fxq "water-amulet" "$2"
                 then
                         declare -a Attack_dmg=(3 4 5 6 7)
                         attack=${Attack_dmg[RANDOM%${#Attack_dmg[@]}]}
                         ((opponent_hp -= attack))
                         echo "you dealt $attack damage!"
                        if [ $opponent_hp -gt 0 ]
                                then echo the opponent’s hp is now $opponent_hp
                        else  echo the opponent’s hp is now 0
                        fi
                 else
                         echo "you can't use water"
                 fi
         else
                 echo "theres nothing to use water against"
 fi
 }

until [ $opponent_hp -le 0 ]
do
        read -p "" input
        if [ "$input" = "water fire-wall inventory" ]
        then
                water fire-wall inventory 
                if [ $opponent_hp -le 0 ]
                        then
                                echo "you put out the wall of fire! proceed to the door. if you can't open it, try using less door"
                                echo ""
                                exit 1
                fi
                echo "keep fighting"
                echo ""
        else
                echo "thats the wrong syntax. try again" ""
        fi

done

if [ $opponent_hp -le 0 ]
        then
                echo "you put out the wall of fire! proceed to the door. if you can't open it, try using less door"
                echo ""
fi
