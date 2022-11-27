#!/bin/bash

echo "instructions"

echo "let's make a backpack! Make a file by typing touch inventory"

read -p "" bag
while [ "$bag" != "touch inventory" ]
do
        echo "That's not the right syntax, try again"
        read -p "" bag
done

touch inventory

echo "type cat dungeon to see your surroundings as your proceed through the dungeon."

echo "let's enter the dungeon! we will be moving through by changing directories, or cd. cd to corridor_1"
echo "make sure to bring your backpack with you! cp inventory corridor_1/inventory"                                                                                 
