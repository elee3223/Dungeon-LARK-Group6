
   _________________________________________________________
 /|     -_-                                             _-  |\
/ |_-_- _                                         -_- _-   -| \   
  |                            _-  _--                      | 
  |                            ,                            | ╱╭╮╭╮╱╱╱╱╱╱╱╭╮
  |      .-'````````'.        '(`        .-'```````'-.      | ╭╯╰┫┃╱╱╱╱╱╱╱┃┃
  |    .` |           `.      `)'      .` |           `.    | ╰╮╭┫╰━┳━━╮╭━╯┣╮╭┳━╮╭━━┳━━┳━━┳━╮         
  |   /   |   ()        \      U      /   |    ()       \   | ╱┃╰┫┃┃┃┃━┫┃╰╯┃╰╯┃┃┃┃╰╯┃┃━┫╰╯┃┃┃┃
  |  |    |    ;         | o   T   o |    |    ;         |  | ╱╰━┻╯╰┻━━╯╰━━┻━━┻╯╰┻━╮┣━━┻━━┻╯╰╯
  |  |    |     ;        |  .  |  .  |    |    ;         |  | ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭━╯┃
  |  |    |     ;        |   . | .   |    |    ;         |  | ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╰━━╯
  |  |    |     ;        |    .|.    |    |    ;         |  |
  |  |    |____;_________|     |     |    |____;_________|  |  
  |  |   /  __ ;   -     |     !     |   /     `'() _ -  |  |
  |  |  / __  ()        -|        -  |  /  __--      -   |  |
  |  | /        __-- _   |   _- _ -  | /        __--_    |  |
  |__|/__________________|___________|/__________________|__|
 /                                             _ -           \
/   -_- _ -             _- _---                       -_-  -_ \
    _                                    

Name of game: The Dungeon
Developed by: Elaine Lee, Jacob Miller, and Samantha Bentley
Narrative: You area a mercenary that is part of a group called Night Raid hired to assist the S.T.O.N.E corporation acquire some elemental stones for a sizeable reward. However, things turn south once they are found, as the henchmen of the corporation are ordered to kill the night raid members assisting them. All perish except the player, the lone survivor, who's now tasked with avenging his bretheren and obtaining these elemental stones from S.T.O.N.E before they can do whatever dastardly plan they intend on using them for.
Instructions: 
` ./ `
      The '.' means don't move, and the name of the script makes the code run.
      this works because it is running them as a shell script.
    Ex:
      ./______ [the blank spot will be filled with the item]
      ~>this will help you inpect and use your surroundings
###################################################################
' pwd ' :
       PWD stores the path of the current directory.
    Ex: 
       pwd   [just that]
       ~>this will show you where you are
###################################################################
Add to your inventory
       Ex:
        echo "[name]" >> inventory

###################################################################
' cd ' :
       cd stands for change directory
       this will move you foward into other directories
     Ex: 
        cd ______ [new location]
        ~>this will move to to the new location
` cd .. `:
         previous directory command
         this brings you back a directory
     Ex:
         cd ..
         ~> this brings you to the previous room
###################################################################
' ls ' :
       ls is short for list
       this command lists directory contents
     Ex: 
        ls   [just that]
        ~>this will list out your surroundings
  >>>'-p' 
       adds a slash ( / ) after each directory file
           Ex: 
              ls -p
              ~>a '/' will be added to the rooms
###################################################################
' cat ' :
       cat is short for concatenate
       this command displays the contents of files without 
       editing them. It is used to create the file with content
    Ex: 
       cat read____ [the blank spot will be filled with the location]
       ~>this will read the prompt for each room
###################################################################
' chmod '
       change access permissions
     Ex:
       chmod u+x ____ [.sh file]
       ~> this will bypass permition denied 
       
###################################################################
' mv ' 
      mv stands for move
      moves files and directories from one-place to another
    Ex:
      mv [obj] [place]/[obj]
###################################################################
' touch ' 
      It is used to create a file without any content.
    Ex:
      touch [file_name]
###################################################################
Use the information you learn to advance through the dungeon, and have fun!!!!

To start, type ./Start.sh
