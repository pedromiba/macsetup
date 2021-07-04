# lists contents of current directory with file permisions
alias ll='ls -l -sort'

# list all directories in current directories
alias ldir='ls -l | grep ^d'

# self explanatory
#alias ..='cd ..'
#alias ...='cd ../../'

# show aliases
alias a='echo "------------Your aliases------------";alias'

# Apply changes to aliases
alias sa='source ~/.bash_aliases;echo "Bash aliases sourced."'

# Edit Aliases
alias via='sudo vi ~/.bash_aliases'
alias nia='sudo nano ~/.bash_aliases'

# Clear Alias
alias cls='clear'