#!/bin/bash
set -euo pipefail

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

cd "$(dirname "$0")"

# Collect arguments, stripping the "homebrew-taskforceai/" prefix
declare -a RUBY_FILES
for file in "$@"; do
  RUBY_FILES+=("${file#homebrew-taskforceai/}")
done

# Execute rubocop with the adjusted paths
if [ "${#RUBY_FILES[@]}" -eq 0 ]; then
  bundle exec rubocop
else
  bundle exec rubocop -- "${RUBY_FILES[@]}"
fi
