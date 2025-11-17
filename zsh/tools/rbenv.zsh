eval "$(rbenv init - --no-rehash zsh)"

# Enable local binstubs for `.git/safe`, added after rbenv init to take precedence
# https://thoughtbot.com/blog/git-safe
export PATH=".git/safe/../../bin:$PATH"
