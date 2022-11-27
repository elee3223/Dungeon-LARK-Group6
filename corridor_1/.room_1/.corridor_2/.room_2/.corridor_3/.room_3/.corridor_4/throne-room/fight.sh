#!/bin/bash

opponent_hp=50
my_hp=50

target="boss"

change-target(){

        declare -a target_arr=(1 2 3 4)
        id=${target_arr[RANDOM%${#target_arr[@]}]}

        case $id in 
        1) target="fire";;
        2) target="water";;
        3) target="grass";;
        4) target="physical";;
        esac

}

read -p "Before we fight lets open up your bag (type inventory): " bag
prompt(){
        cat $bag
        echo ""
        read -p "what would you like to use?: " choice

        if [[ "$choice" = *"-amulet" ]]
                then 
                        $choice $target $bag
         elif [[ "$choice" = "potion:healing"* ]]
                then      
                        echo "the effects of the potion has granted you a full recovery!"
                        my_hp=50
                        sed -e '/potion:healing/d' -i $bag
        elif grep -Fxq $choice "$bag"
                then
                        deal_dmg-melee
                        reg-opp-move
       
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

deal_reg-dmg(){
        declare -a Attack_dmg=(3 4 5 6)
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
        echo "you got dealt $attack damage!"
        echo ""
      

}

reg-opp-move(){
        declare -a Attack_dmg=(5 6 7 8 9 10)
        attack=${Attack_dmg[RANDOM%${#Attack_dmg[@]}]}
        ((my_hp -= attack))
        echo ""
        echo "the boss is attacking"
        echo "you got dealt $attack damage!"
        echo "" 
}
echo""


fire-amulet() {
 if [[ "$1" = *"grass"* ]]
        
        then
                echo "your elemental powers beat your opponent's!"
               deal_dmg
 elif [[ "$1" = "water" ]]
        then    echo "your opponent is using a $1 based attack..."
                echo "your attack has been vaporized... it was ineffective!"
                opp-move
 elif [[ "$1" = "fire" ]]
        then    echo "your attack has been canceled out by the same element."
 else
	echo "your opponent is using a $1 based attack..."
        deal_reg-dmg 
        reg-opp-move
		
 fi
 }


water-amulet() {
 if [[ "$1" = *"fire"* ]]
        
        then
                echo "your elemental powers beat your opponent's!"
               deal_dmg
 elif [[ "$1" = "grass" ]]
        then    echo "your opponent is using a $1 based attack..."
                echo "your attack has been absorbed... it was ineffective!"
                opp-move
 elif [[ "$1" = "water" ]]
        then    echo "your attack has been canceled out by the same element."
 else
	echo "your opponent is using a $1 based attack..."
        deal_reg-dmg 
        reg-opp-move
		
 fi
 }

grass-amulet() {
 if [[ "$1" = *"water"* ]]
        
        then
                echo "your elemental powers beat your opponent's!"
               deal_dmg
 elif [[ "$1" = "fire" ]]
        then    echo "your opponent is using a $1 based attack..."
                echo "your attack has been burned... it was ineffective!"
                opp-move
 elif [[ "$1" = "grass" ]]
        then    echo "your attack has been canceled out by the same element."
 else
        echo "your opponent is using a $1 based attack..."
        deal_reg-dmg 
        reg-opp-move
	
		
 fi
 }

until [ $opponent_hp -le 0 ]
 do
        echo "========================================="

        change-target
        prompt

        if [ $opponent_hp -gt 0 ]
            then echo the opponent’s hp is now $opponent_hp
                echo ""
        else  echo the opponent’s hp is now 0
        fi

          if [ $my_hp -gt 0 ]
            then echo your hp is now $my_hp
                echo ""
        else  echo the your hp is now 0
                echo "you died! Returning to the home menu... "
                
                exit 1

        fi

                if [ $opponent_hp -le 0 ]
                    then
                            echo "you beat the final boss! cat .victory to see the fruits of your efforts"
                            echo ""
                            exit 1
                    fi
                echo "keep fighting"
                echo ""
        echo "========================================="

 done




