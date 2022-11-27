#!/bin/bash

opponent_hp=25

deal_dmg(){
        declare -a Attack_dmg=(5 6 7 8 9)
        attack=${Attack_dmg[RANDOM%${#Attack_dmg[@]}]}
        ((opponent_hp -= attack))
        echo "you dealt $attack damage!"
        if [ $opponent_hp -gt 0 ]
            then echo the opponent’s hp is now $opponent_hp
        else  echo the opponent’s hp is now 0
        fi
}

echo "fire plant-boss inventory"
echo""

fire() {
 if [[ "$1" = "plant-boss" ]]
         then
                 if grep -Fxq "fire-amulet" "$2"
                 then
                        deal_dmg
        	else
			echo "you can't use fire!"
		 fi
         else
                 echo "theres nothing to use fire against"
 fi
 }

until [ $opponent_hp -le 0 ]
do
        read -p "" input
        if [[ "$input" = *"fire"* ]]
        then
		fire plant-boss inventory
                if [ $opponent_hp -le 0 ]
                        then
                                echo "you beat the boss! proceed to the door. if you can't open it, try using less door"
                                echo ""
                                exit 1
                fi
                echo "keep fighting"
                echo ""
        fi

done

if [ $opponent_hp -le 0 ]
        then
                echo "you put out the wall of fire! proceed to the door. if you can't open it, try using less door"
                echo ""
fi

