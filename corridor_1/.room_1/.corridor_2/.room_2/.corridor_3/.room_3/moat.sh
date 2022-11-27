#!/bin/bash

echo "grass water-moat inventory"
echo""

opponent_hp=1

 grass() {
 if [[ "$1" = *"water"* ]]
         then
                 if grep -Fxq "grass-amulet" "$2"
                 then
                        ((opponent_hp=0))
                 else
                         echo "you can't use water"
                 fi
         else
                 echo "theres nothing to use grass against"
 fi
 }

until [ $opponent_hp -le 0 ]
do
        read -p "" input
        if [ "$input" = "grass water-moat inventory" ]
        then
                grass water-moat inventory
                if [ $opponent_hp -le 0 ]
                        then
                                echo "you invoke the power of the grass amulet. a bridge of vines are summoned"
                                echo "a path revealed itself     cat .path"
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

