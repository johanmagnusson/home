#!/bin/bash

COLOR_CONF="${HOME}/.colors"
if [ -f ${COLOR_CONF} ]; then
    . ${COLOR_CONF}
fi

# set the default prompt color
COLOR_PROMPT=$COLOR_DEFAULT

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

# bash specifics

# don't put duplicate lines in the history
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# size of history
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
