setopt auto_cd

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_to_home

# Command spell check 
setopt correct
setopt correct_all

# {a-c} -> a b c
setopt brace_ccl

# Automatically delete slash complemented by supplemented by inserting a space
setopt auto_remove_slash

# No beep
setopt no_beep
setopt no_list_beep
setopt no_hist_beep

# Expand '=command' as path of command
# e.g.) '=ls' -> '/bin/ls'
setopt equals

# Look for a sub-directory in $PATH when the slash is included in the command
setopt path_dirs

# Show exit status if it's except zero.
setopt print_exit_value

# Confirm when executing 'rm *'
setopt rm_star_wait

# Let me know immediately when terminating job
setopt notify

# Disable Ctrl-d (Use 'exit', 'logout')
setopt ignore_eof

# Show process ID
setopt long_list_jobs

# enable to expand ~ after =
# e.g.) --prefix=~/local
setopt magic_equal_subst

# Ignore case when glob
setopt no_case_glob

# Use '*, ~, ^' as regular expression
setopt extended_glob

# If the path is directory, add '/' to path tail when generating path by glob
setopt mark_dirs

# Sort numeric order not lexical order
setopt numeric_glob_sort

# Do not record an event that was just recorded again
setopt hist_ignore_dups

# Delete an old recorded event if a new event is a duplicate
setopt hist_ignore_all_dups
setopt hist_save_no_dups

# Expire a duplicate event first when trimming history
setopt hist_expire_dups_first

# Do not display a previously found event
setopt hist_find_no_dups

# Pack extra blank
setopt hist_reduce_blanks

# Remove comannd of 'history' or 'fc -l' from history list
setopt hist_no_store

# Remove functions from history list
setopt hist_no_functions

# Record start and end time to history file
setopt extended_history

# Write to the history file immediately, not when the shell exits.
setopt inc_append_history

# Ignore the beginning space command to history file
setopt hist_ignore_space

# Append to history file
setopt append_history

# Edit history file during call history before executing
setopt hist_verify

# Enable history system like a Bash
setopt bang_hist
