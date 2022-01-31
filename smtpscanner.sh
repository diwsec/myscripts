RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
PURPLE='\033[0;35m'

echo -e "\n\e[36m[\e[32m$\e[36m]\e[92m diwusec\e[0m\n";

echo -e "\n\e[36m[\e[32m*\e[36m]\e[92m started 21/OPEN checks\e[0m\n";
nmap -p 25 -Pn $1 -oG - | grep "open" | anew 25open.txt && cat 25open.txt | grep -Eoi "(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])" | anew 25ips.txt

read -p "COMMAND enummeration(y/n)" nmap
if [ "$nmap" == "y" ]
then
	nmap -iL 25ips.txt -p 25 --script smtp-commands -Pn | tee -a smtpcom.txt
else
printf "${RED}terminated${NC}\n"
fi

read -p "USER enummeration(y/n)" nmap
if [ "$nmap" == "y" ]
then
        nmap -iL 25ips.txt -p 25 --script smtp-enum-users -Pn | tee -a smtpuser.txt 
else
printf "${RED}terminated${NC}\n"                                               
fi
