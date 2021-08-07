# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/smola/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
alias ls='ls --color=auto'
alias 'ls -l'='ls -l --color=auto'

# added for Miniconda 3
export PATH="/home/smola/miniconda3/bin:$PATH"

# added for bundler
export PATH="/home/smola/.gem/ruby/3.0.0/bin:$PATH"

# added for Isabelle2021
export PATH="/home/smola/Programmes/Isabelle2021/bin:$PATH"
