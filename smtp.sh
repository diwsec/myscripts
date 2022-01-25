RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

printf "${GREEN}diwusec${RED} hacks${NC}\n"

read -p "target ip " ip

read -p "nmap smtp(y/n)" nmap
if [ "$nmap" == "y" ]
then
    nmap -p 25 -Pn -oG - $ip
else
printf "${RED}canceled${NC}\n"
fi

read -p "nmap smtp-commads(y/n)" nmap
if [ "$nmap" == "y" ]
then
	nmap -p 25 -Pn --script smtp-commands $ip
else
printf "${RED}canceled${NC}\n"
fi

read -p "nmap smtp-enum-users(y/n)" nmap
if [ "$nmap" == "y" ]
then
nmap --script smtp-enum-users -Pn $ip
else
printf "${RED}canceled${NC}\n"
fi

read -p "nmap smtp-open-relay(y/n)" nmap
if [ "$nmap" == "y" ]
then
nmap --script smtp-open-relay -Pn $ip
else
printf "${RED}canceled${NC}\n"
fi

read -p "msf(y/n)" msf
if [ "$msf" == "y" ]
then
sudo docker start d2c9159718ba
sudo docker exec -it d2c9159718ba /bin/bash
else
printf "${RED}canceled${NC}\n"
fi
