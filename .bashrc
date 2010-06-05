#!/bin/bash

SCRIPTS_DIR="${HOME}/.scripts"

export PATH="${SCRIPTS_DIR}:${PATH}"

if [ -d ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

if [ -f ~/.bash_alias ]; then
    . ~/.bash_alias
fi
