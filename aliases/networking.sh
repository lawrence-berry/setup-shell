# Networking aliases. myip and allmyips are in Darwin/networking.sh and Linux/networking.sh.

alias myexternalip='curl -s https://api.ipify.org; echo'
alias alllocalips='nmap -sn 192.168.0.0/24'
alias urldecode='(printf "%b\n" "$(sed "s/+/ /g; s/%/\\\\x/g")")'
alias porthog='lsof -nP -iTCP -sTCP:LISTEN | grep'                # porthog :3000
