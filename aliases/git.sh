# Git aliases. wgd needs the GitHub CLI (gh).

alias g='git'
alias push='git push origin HEAD'
alias fpush='git push origin HEAD --force-with-lease'
alias rollback='git reset --hard HEAD'
alias dollback='git clean -d -x -f && git reset --hard HEAD'
alias lastdiff='git diff HEAD~1'
alias amend='git add -A && git commit --amend --no-edit'
alias wgd='gh pr list --web --search "-label:dependencies"'
alias gitcheck='ssh -T git@github.com'
