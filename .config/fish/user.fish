# Add user configurations here
# For HyDE to not touch your beloved configurations,
# we added a config file for you to customize HyDE

#  Aliases 
# Override aliases here in 'config.fish' (already set )

# # Helpful aliases
alias c='clear' # but don't use this one tho! just press `CLTR+l`
alias l='eza -lh --icons=auto' # long list
alias ls='eza -1 --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias fastfetch='fastfetch --logo-type kitty'
alias sv='sudo -E nvim'
alias sy='sudo -E yazi'
alias v='nvim'
alias y='yazi'
alias xcopy='xclip -selection clipboard'
alias xpaste='xclip -selection clipboard -o'

# # Directory navigation shortcuts
# alias ..='cd ..'
# alias ...='cd ../..'
# alias .3='cd ../../..'
# alias .4='cd ../../../..'
# alias .5='cd ../../../../..'

# # Always mkdir a path (this doesn't inhibit functionality to make a single dir)
# alias mkdir='mkdir -p'

#  This is your file 
# Add your configurations here

set EDITOR nvim
