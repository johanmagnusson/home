prompt_dir() {
  # Check for git repo
  local git_root=$(git rev-parse --show-toplevel 2>/dev/null)

  if [[ -n "$git_root" ]]; then
    local rel_path="${PWD#$git_root}"
    local repo_name="${git_root:t}"
    local branch=$(git branch --show-current 2>/dev/null)

    # Provide repo root
    local result="%B$repo_name%b"

    # Append relative path to repo root
    if [[ -n "$rel_path" ]]; then
      result="$result$rel_path"
    fi

    # Append branch information
    if [[ -n "$branch" ]]; then
      local dirty_branch=""
      if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
        dirty_branch="*"
      fi

      result="$result ($branch$dirty_branch)"
    fi

    echo "$result"
  else
    echo "%B%c%b"
  fi
}

setopt PROMPT_SUBST

PS1='%F{8}$(prompt_dir)%f
%# '
