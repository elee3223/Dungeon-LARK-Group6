#!/bin/bash

echo "recall how you took down the wall of fire..."
sleep 1
tput setaf 4
 echo "
 ./fight.sh fire-wall inventory

\"fire-wall\" is your first argument. This is locking onto your first target with the amulet's first usage.
\"inventory\" is your second argument. This is how you are accessing the water amulet to use it."
tput sgr0
echo""
echo "Use the same syntax to overcome this obstacle! Use water-moat as your first argument."

opponent_hp=1

if test -f $2
then
 grass() {
 if [[ "$1" = *"water"* ]]
         then
                 if grep -Fxq "grass-amulet" "$2"
                 then
                        ((opponent_hp=0))
                 else
                          echo "You don't have a grass-amulet..."
                         echo "you can't use grass!"
                 fi
         else
                 echo "theres nothing to use grass against."
 fi
 }
 else 
  echo "$2 doesn't seem to be here... did you bring it from the other room?"
  echo " to return to the other room cd ../."
  exit 1
 fi
 


until [ $opponent_hp -le 0 ]
do
        read -p "" input
        if [ "$input" = "grass water-moat inventory" ]
        then
                grass water-moat inventory
                if [ $opponent_hp -le 0 ]
                        then
                                echo "you invoke the power of the grass amulet. a bridge of vines are summoned"
                                echo "a path revealed itself... cat .path"
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

