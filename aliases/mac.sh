# Mac aliases: skipped by install.sh on other platforms.

alias idk="printf '%s' '¯\_(ツ)_/¯' | pbcopy"
alias freespace='diskutil info / | grep "Free Space"'
alias flushdns='dscacheutil -flushcache; sudo killall -HUP mDNSResponder; say flushed'
alias recoverymode='sudo nvram "recovery-boot-mode=unused" && sudo reboot'
