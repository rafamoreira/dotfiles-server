# # # # # # # #
#  COMPLETION #
# # # # # # # #
autoload -Uz compinit 
compinit
zstyle ':completion:*' menu select # interactive completion
setopt COMPLETE_ALIASES # auto complete command line aliases

# # # # # #
# PROMPT  #
# # # # # #
autoload -Uz promptinit
promptinit
prompt walters # Set the theme 
bindkey -e # emacs mode

# # # # # # # # # # # # #
# History Configuration #
# # # # # # # # # # # # # 
HISTSIZE=10000              # How many lines of history to keep in memory
HISTFILESIZE=10000          # Number of commands to save in the file
SAVEHIST=10000              # Number of history entries to save to disk
HISTFILE=~/.zsh_history     # Where to save history to disk
HISTDUP=erase               # Erase duplicates in the history file
setopt hist_ignore_dups     # Ignore duplicates
setopt append_history        # Append history to the history file (no overwriting)
setopt share_history         # Share history across terminals
setopt inc_append_history     # Immediately append to the history file, not just when a term is killed

# # # # # # # # # #
# HISTORY SEARCH  #
# # # # # # # # # #
autoload -U up-line-or-beginning-search 
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search


 

# # # # #
# PATH  #
# # # # #
export PATH=$HOME/.local/bin:$PATH

