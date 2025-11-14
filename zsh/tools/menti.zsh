#compdef menti
###-begin-menti-completions-###
#
# yargs command completion script
#
# Installation: menti completion >> ~/.zshrc
#    or menti completion >> ~/.zprofile on OSX.
#
_menti_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" menti --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _menti_yargs_completions menti
###-end-menti-completions-###

# from `menti localsecrets`
source <(menti activate)
