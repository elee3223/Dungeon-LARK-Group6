#!/bin/bash
echo "=============================================="
echo "locked door. needs special item to unlock.Look through your inventory by putting it as an argument"
echo
echo "ex: ./locked_door.sh inventory"
if test -f $2
then
	echo ""
else
  echo "$2 doesn't seem to be here... did you bring it from the other room?"
  echo " to return to the other room cd ../."
  exit 1
 fi
 
if [ $# -eq 1 ]
then
	if [ $(grep "potion" $1 | wc -l) -gt 1 ]
		then echo "you picked up too many potions, and your backpack might break. remove one with sed -i '/item/d' inventory"
		else
		for i in $(cat ${1})
       		 do
                if [ "$i" != "grass-amulet" ]
                        then echo "hmm...the door won't open for the $i"
			sleep 1
                else
                        echo ""
			echo "the grass amulet's power unlocked the door! you can now move onto the next area. Move onto .room_3."
			echo ""
			echo "Remember to take your bag with you! Do this by entering the following command:"
			echo "mv inventory ./.room_3/inventory"
			echo ""
			echo "=============================================="
			exit 1
                fi

      		  done
	fi
elif [ $# -gt 2 ]
	then 
		echo "too many arguments. try again." ""
	else
		exit 1
fi

