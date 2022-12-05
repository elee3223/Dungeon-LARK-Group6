#!/bin/bash

opponent_hp=25
my_hp=50
target="plant boss"

echo "=============================================="
echo "The vines are starting to move and come to life... It became a monster!"

read -p "Before we fight lets open up your bag (type inventory): " bag
if test -f $bag
then echo ""
else  
	echo "$2 doesn't seem to be here... did you bring it from the other room?"
	echo "to return to the other room cd ../."
	exit 1
fi
  
prompt(){
        cat $bag
        echo ""
        read -p "what would you like to use?: " choice

        if [[ "$choice" = *"-amulet" ]]
                then 
                        $choice $target $bag
			sleep 1
        elif grep -Fxq $choice "$bag"
                then
                        deal_dmg-melee
			sleep 1
        else   
                echo "you don't have $weapon in your bag!"
        fi
}

deal_dmg(){
        declare -a Attack_dmg=(5 6 7 8 9)
        attack=${Attack_dmg[RANDOM%${#Attack_dmg[@]}]}
        ((opponent_hp -= attack))
        echo ""
        echo "you dealt $attack damage!"
        echo ""
        
}

deal_dmg-melee(){
        declare -a Attack_dmg=(1 2 3 4 5)
        attack=${Attack_dmg[RANDOM%${#Attack_dmg[@]}]}
        ((opponent_hp -= attack))
        echo ""
        echo "you dealt $attack damage!"
        echo ""
        
}

opp-move() {

        declare -a Attack_dmg=(8 9 10 11 12)
        attack=${Attack_dmg[RANDOM%${#Attack_dmg[@]}]}
        ((my_hp -= attack))
        echo ""
        echo "the boss is attacking"
	sleep 1
        echo "you got dealt $attack damage!"
        echo ""
      

}

echo""


fire-amulet() {
 if [[ "$1" = *"plant"* ]]
         then
                 if grep -Fxq "fire-amulet" "$bag"
                 then
                        deal_dmg
        	else
			echo "you can't use fire!"
		 fi
         else
                 echo "fire is ineffective"
 fi
 }


water-amulet() {
 if [[ "$1" = *"fire"* ]]
         then
                 if grep -Fxq "water-amulet" "$2"
                 then
                        deal_dmg
        	else
			echo "you can't use water!"
		 fi
         else
                 echo "The vines absorbed your attack... water is ineffective!"
 fi
 }

until [ $opponent_hp -le 0 ]
 do
        echo "========================================="

        prompt

        opp-move

        if [ $opponent_hp -gt 0 ]
            then echo the opponent’s hp is now $opponent_hp
	    sleep 1
                echo ""
        else  echo the opponent’s hp is now 0
        fi

          if [ $my_hp -gt 0 ]
            then echo your hp is now $my_hp
                echo ""
        else  echo the your hp is now 0
                echo "you died! 
			To restart the fight, run the script again
			To exit, cd ../../../."
		
                
                exit 1

        fi

                if [ $opponent_hp -le 0 ]
                        then
                                echo "You burned down the vines! the hidden door has revealed itself. cat .door"
                                echo ""
                                echo "bring your backpack to .corridor_3/inventory"
                                exit 1
                fi
                echo "keep fighting"
                echo ""
        echo "========================================="

 done

