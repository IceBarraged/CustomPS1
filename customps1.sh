#!/bin/bash

#gets the longest part of a text input, outputs an integer.
len()
{
  echo "$1" | awk '{print length}' | sort -nu | tail -n 1
}

#calculates padding to center text based on string length
center()
{
  if (( "$1" > "$term_width" )); then
    echo 0
  else
    echo $(( ("$term_width" - "$1") / 2 ))
  fi
}

customps1_ascii="
  _______  ________________  __  ______  _______
 / ___/ / / / __/_  __/ __ \/  |/  / _ \/ __<  /
/ /__/ /_/ /\ \  / / / /_/ / /|_/ / ___/\ \ / /
\___/\____/___/ /_/  \____/_/  /_/_/  /___//_/

"
mylink="https://github.com/IceBarraged"

#colour definitions
#regular colors
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

#bold colors
BOLD_BLACK='\033[1;30m'
BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
BOLD_YELLOW='\033[1;33m'
BOLD_BLUE='\033[1;34m'
BOLD_MAGENTA='\033[1;35m'
BOLD_CYAN='\033[1;36m'
BOLD_WHITE='\033[1;37m'

#underline colors
UNDERLINE_BLACK='\033[4;30m'
UNDERLINE_RED='\033[4;31m'
UNDERLINE_GREEN='\033[4;32m'
UNDERLINE_YELLOW='\033[4;33m'
UNDERLINE_BLUE='\033[4;34m'
UNDERLINE_MAGENTA='\033[4;35m'
UNDERLINE_CYAN='\033[4;36m'
UNDERLINE_WHITE='\033[4;37m'

#background colors
BG_BLACK='\033[40m'
BG_RED='\033[41m'
BG_GREEN='\033[42m'
BG_YELLOW='\033[43m'
BG_BLUE='\033[44m'
BG_MAGENTA='\033[45m'
BG_CYAN='\033[46m'
BG_WHITE='\033[47m'

#high intensity colors
INTENSE_BLACK='\033[0;90m'
INTENSE_RED='\033[0;91m'
INTENSE_GREEN='\033[0;92m'
INTENSE_YELLOW='\033[0;93m'
INTENSE_BLUE='\033[0;94m'
INTENSE_MAGENTA='\033[0;95m'
INTENSE_CYAN='\033[0;96m'
INTENSE_WHITE='\033[0;97m'

#high intensity bold colors
BOLD_INTENSE_BLACK='\033[1;90m'
BOLD_INTENSE_RED='\033[1;91m'
BOLD_INTENSE_GREEN='\033[1;92m'
BOLD_INTENSE_YELLOW='\033[1;93m'
BOLD_INTENSE_BLUE='\033[1;94m'
BOLD_INTENSE_MAGENTA='\033[1;95m'
BOLD_INTENSE_CYAN='\033[1;96m'
BOLD_INTENSE_WHITE='\033[1;97m'

#high intensity background colors
BG_INTENSE_BLACK='\033[0;100m'
BG_INTENSE_RED='\033[0;101m'
BG_INTENSE_GREEN='\033[0;102m'
BG_INTENSE_YELLOW='\033[0;103m'
BG_INTENSE_BLUE='\033[0;104m'
BG_INTENSE_MAGENTA='\033[0;105m'
BG_INTENSE_CYAN='\033[0;106m'
BG_INTENSE_WHITE='\033[0;107m'

#reset color
NC='\033[0m'

#Loop to reset after user choice. Escaped with CTRL C or Exit option.
while true; do
clear

#get terminal width and create a line of # that fills the entire terminal width
term_width=$(tput cols)
hashline=$(printf "#%.0s" $(seq 1 $term_width))

art_width=$(len "$customps1_ascii")

#logic in case screen width is less than the ascii art length
if [ "$art_width" -lt "$term_width" ]; then

  #get padding for ascii 
  spaces_ascii=$(center "$art_width")

  #get length and padding of mylink
  mylink_width=$(len "$mylink")
  spaces_mylink=$(center "$mylink_width")

  #print centered welcome message
  echo "$hashline"

  while IFS= read -r line; do
    printf "%${spaces_ascii}s%s\n" "" "$line"
  done <<< "$customps1_ascii"

  printf "%${spaces_mylink}s%s\n" "" "$mylink"
  echo "$hashline"

else

  #print ascii on left
  echo "$hashline"
  echo "$customps1_ascii"
  echo "$mylink"
  echo "$hashline"

fi

echo ""
echo "IMPORTANT: Call THIS SCRIPT WITH '. customps1.sh' or 'source customps1.sh' for correct functionality."
echo "Select an option from the list with [option number] or type 'help [option number]' to display an explanation for that command."

echo ""

#add options menu
echo "1: Get config PS1."
echo "2: Get custom PS1."
echo "3: Exit."

#read user input
read -p "Choose an option: " choice

#case
case $choice in
	1) echo -e "your current config ps1 is: $(PS1=$PS1 bash -i -c 'echo $PS1')"; ;;
	2) clear
	   echo  "select an option from the list below with [option number]" 
	   echo ""
	   echo -e "1: Patriot: ${BLUE}[USERNAME]${WHITE}@[HOSTNAME] ${RED}[WORKING DIRECTORY] ${NC}[PROMPT SIGN] "
	   echo -e "2: Rolex: [DATE] [TIME] ${GREEN}[USERNAME]${WHITE}@${GREEN}[HOSTNAME]${WHITE}:${INTENSE_BLUE}[WORKING DIRECTORY]${NC}[PROMPT SIGN]"
	   echo -e "3: OG: ${GREEN}[USERNAME]${WHITE}@${GREEN}[HOSTNAME]${WHITE}:${INTENSE_BLUE}[WORKING DIRECTORY]${NC}[PROMPT SIGN]"
	   read -p "Choose an option: " ps1choice
		
		case $ps1choice in
			1) echo "Patriot has been set."
			   export PS1="$(tput setaf 12)\u$(tput setaf 15)@$(tput setaf 15)\h $(tput setaf 9)\w $(tput sgr0)$ "; ;;
			2) echo "Rolex has been set."
			   export PS1='\d \A \e[92m\u\e[97m@\e[92m\H\e[0m:\e[38;5;45m\w\e[0m$'; ;;
			3) echo "OG has been set."
			   export PS1='\e[92m\u\e[0m@\e[92m\h\e[0m:\e[38;5;33m\w\e[0m\$'; ;;
			*) echo "Invalid choice."; ;;
		esac
	   ;;
	3) echo -e "${YELLOW}Goodbye!${NC}"; break;;
	*) echo "Invalid choice.";  ;;
esac
read -p "Press any key to continue..." -n 1 -s
done
