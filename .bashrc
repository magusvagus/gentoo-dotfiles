# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


clear
TERM=xterm-256color


# this script checks if X is on and set the according aliases and bash prompt
XTEST=$(ps -e | grep X)

if [[ -z "$XTEST" ]]; 
then
  echo " "
  echo " No X server detected!"
  echo " Entering tyy mode."
  echo " "
  alias neofetch='\neofetch --config none'
  # code to be executed if the condition is true
else
  # set custom bash command line
  export PS1=" \[\e[35m\]󰊠\[\e[m\]\[\e[35m\] \[\e[m\]\[\e[32m\]\w\[\e[m\] "
  alias neofetch='neofetch --source ~/.config/neofetch/gentoo_ascii.txt'

  # run the termnal only with tmux, when the X server is running.
  # for tmux keep starting with terminal, not replicating inside itself
  if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux
  fi

fi

# set standart system editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# different sets of bash prompts for testing
#export PS1=" \[\e[31m\]󰣨 \[\e[m\] \w "
#export PS1=" \[\e[22m\]󰊠\[\e[m\] \[\]\w\[\e[m\] "
#export PS1=" \[\e[32m\]󰊠\[\e[m\]\[\e[32m\] \[\e[m\]\[\e[32m\]\w\[\e[m\] "

# alias tmux="tmux -f ~/.tmux.conf"
# # for tmux keep starting with terminal, not replicating inside itself
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

# start on terminal start
neofetch --source ~/.config/neofetch/gentoo_ascii.txt

# fzf configuration
eval "$(fzf --bash)"

# git script to show git status
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_THEME=BlackOrWhite
    GIT_PROMPT_ONLY_IN_REPO=1
    source "$HOME/.bash-git-prompt/gitprompt.sh"
fi


# set aliases
alias vim='nvim'
alias vi='nvim'

#alias vif='nvim $(fzf -m --preview="bat --color=always {}")'
alias vif='nvim $(fzf -m --preview="cat {}")'
alias cdf='cd $(find . -type d -print | fzf)'
alias ip='ip -c'
#alias tmux="TERM=screen-256color-bce tmux"

# has been put into the if statement
# alias neofetch='neofetch --source ~/.config/neofetch/gentoo_ascii.txt'

# activate vim mode for bash
set -o vi


# add every command used to history
export PROMPT_COMMAND='history -a'
# set bash history file size (number of stored commands) defualt is 500
export HISTSIZE=2500
export HISTFILESIZE=2500




