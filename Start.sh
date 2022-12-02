#!/bin/bash

==============================================

echo "Welcome to the Dungeon! Your adventure is getting started..."
sleep 2

echo "" 
echo "Let's make a backpack! Make a file by typing touch inventory"
echo ""
read -p "" bag
while [ "$bag" != "touch inventory" ]
do
        echo "That's not the right syntax, try again!"
        echo ""
        read -p "" bag
done

touch inventory

echo "Now let's enter the dungeon!"
echo ""
echo "To see your surroundings as your proceed through the dungeon type ls, then cat dungeon"
echo ""
echo "We will be moving through by changing directories, or cd."
echo "HINT: cd corridor_1"
echo ""
echo "make sure to bring your backpack with you!"
echo "HINT: mv inventory corridor_1/inventory"  
echo ""
sleep 2
printf "\n\nPress any key to continue"
read -n 1


==============================================
                               
