# Networking aliases. myip and allmyips are in mac.sh and linux.sh.

alias myexternalip='curl -s https://api.ipify.org; echo'
alias alllocalips='nmap -sn 192.168.0.0/24'

# Decodes a URL-encoded string from stdin: echo 'a%20b' | urldecode
urldecode() { _s=$(cat); _s=${_s//+/ }; printf '%b\n' "${_s//\%/\\x}"; unset _s; }

# Shows what is listening on a port (default 3000): porthog 8080
porthog() { lsof -nP -iTCP:"${1:-3000}" -sTCP:LISTEN; }
