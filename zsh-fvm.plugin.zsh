#!/usr/bin/env zsh

# Exit if the 'fvm' command can not be found
if ! (( $+commands[fvm] )); then
    echo "ERROR: 'fvm' command not found"
    return
fi

# Completions directory for `fvm` command
local COMPLETIONS_DIR="${0:A:h}/completions"

# Only regenerate completions if older than 24 hours, or does not exist
if [[ ! -f "$COMPLETIONS_DIR/_fvm"  ||  ! $(find "$COMPLETIONS_DIR/_fvm" -newermt "24 hours ago" -print) ]]; then
  curl -S -s -o "$COMPLETIONS_DIR/_fvm" https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_fvm
fi

# Add completions to the FPATH
typeset -TUx FPATH fpath
fpath=("$COMPLETIONS_DIR" $fpath)
