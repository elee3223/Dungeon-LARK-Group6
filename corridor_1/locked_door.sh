#!/bin/bash

echo "locked door. needs special item to unlock.Look through your inventory by putting it as an argument"


if [ $# -eq 1 ]
then
        for i in $(cat ${1})
        do
                if [ "$i" != "water-amulet" ]
                        then echo "hmm...the door won't open for the $i"
                        sleep 1
                else
                        echo "the water amulet's power unlocked the door! you can now move onto the next area. Move onto .room_1."
			mv $1 ./.room_1/inventory
		fi

        done
fi
