#!/bin/bash

# load host specifics
HOST_CONF="${HOME}/.${HOSTNAME}"
if [ -f ${HOST_CONF} ]; then
    . ${HOST_CONF}
fi

# load os specifics
OS_ID=`uname | tr A-Z a-z` # translate uppercase to lowercase
OS_CONF="${HOME}/.${OS_ID}"
if [ -f ${OS_CONF} ]; then
    . ${OS_CONF}
fi

if [ -f ~/.environment ]; then
    . ~/.environment
fi

if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

if [ -f ~/.bash_alias ]; then
    . ~/.bash_alias
fi
