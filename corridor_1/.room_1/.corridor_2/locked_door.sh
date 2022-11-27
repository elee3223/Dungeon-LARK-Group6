#!/bin/bash

echo "locked door. needs special item to unlock.Look through your inventory by putting it as an argument"
echo ""

if [ $# -eq 1 ]
then
	if [ $(grep "potion" $1 | wc -l) -gt 1 ]
		then echo "you picked up too many potions, and your backpack might break. remove one with sed -i '/item/d' inventory"
		else
		for i in $(cat ${1})
       		 do
                if [ "$i" != "fire-amulet" ]
                        then echo "hmm...the door won't open for the $i"
			sleep 1
                else
                        echo "the fire amulet's power unlocked the door! you can now move onto the next area. Move onto .room_2."
			echo ""
			break
                        cp $1 ./.room_2/inventory
                fi

      		  done
	fi
elif [ $# -gt 2 ]
	then 
		echo "too many arguments. try again." ""
	else
		exit 1
fi
