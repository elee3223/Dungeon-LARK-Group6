#!/bin/bash

echo "There is a locked door. It seems it needs a special item to unlock. Look through your inventory by running the script again and putting your inventory as an argument"
echo ""

if [ $# -eq 1 ]
then
	if test -f $1 
	then
		if [ $(grep "potion" $1 | wc -l) -gt 1 ]
			then echo "you picked up too many potions, and your backpack might break. remove one with sed -i ''0,/item/{/item/d;}'' inventory"
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
	  echo "$1 doesn't seem to be here... did you bring it from the other room?"
 	 echo " to return to the other room cd ../."
	fi
elif [ $# -gt 2 ]
	then 
		echo "too many arguments. try again." ""
	else
		return
fi
