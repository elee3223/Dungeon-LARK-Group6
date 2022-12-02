#!/bin/bash


echo "=============================================="

echo "LOCKED DOOR. This needs a special item to unlock. Try looking through your inventory by running this script again and putting you inventory as an argument"
echo
echo "ex: ./locked_door.sh inventory"


if [ $# -eq 1 ]
then
        for i in $(cat ${1})
        do
                if [ "$i" != "water-amulet" ]
                        then echo "hmm...the door won't open for the $i"
                        sleep 1
                else
                        echo ""
			echo "the water amulet's power unlocked the door! you can now move onto the next area. Move onto .room_1."
			echo ""
			echo "Remember to take your bag with you! Do this by entering the following command:"
			echo "mv inventory ./.room_1/inventory"
			echo ""
			echo "=============================================="
			exit 1
		fi

        done
fi
