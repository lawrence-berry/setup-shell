# Networking aliases for macOS.

alias myip='ipconfig getifaddr en0'
alias allmyips="ifconfig | awk '/inet .*broadcast/ {print \$2}'"
alias flushdns='dscacheutil -flushcache; sudo killall -HUP mDNSResponder; say flushed'
