# Linux aliases: skipped by install.sh on other platforms.

alias sagi='sudo apt-get install'
alias sagu='sudo apt-get update'
alias sagr='sudo apt-get remove'
alias sagrp='sudo apt-get remove --purge'
alias checkversion='dpkg -l | grep ii | grep'
alias whichlinux='lsb_release -a'
alias whichlinuxrelease='cat /etc/*release'
alias sshlogins='grep -i accept /var/log/auth.log'

alias myip="hostname -I | awk '{print \$1}'"
alias allmyips='hostname -I'
