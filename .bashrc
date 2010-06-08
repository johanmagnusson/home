#!/bin/bash

if [ -f ~/.environment ]; then
    . ~/.environment
fi

if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

if [ -f ~/.bash_alias ]; then
    . ~/.bash_alias
fi

# load host specifics
HOST_ENV="${HOME}/.${HOSTNAME}"
if [ -f ${HOST_ENV} ]; then
    . ${HOST_ENV}
fi
