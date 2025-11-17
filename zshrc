# Identify where this file is located
ZCONFIG="$HOME/.dotfiles/zsh"

# Core components
source "$ZCONFIG/aliases.zsh"
source "$ZCONFIG/prompt.zsh"
source "$ZCONFIG/completions.zsh"

# Load tool-specific configs
for config in $ZCONFIG/tools/*.zsh(N); do
  source "$config"
done
