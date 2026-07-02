#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")"

shellcheck run-rubocop.sh run-checks.sh

test_rubocop_wrapper_rejects_option_injection() {
  local tmpdir marker payload status marker_created

  tmpdir="$(mktemp -d "${TMPDIR:-/tmp}/rubocop-option-injection.XXXXXX")"
  marker="$tmpdir/marker.txt"
  payload="$tmpdir/payload.rb"
  marker_created=0

  printf '%s\n' '# frozen_string_literal: true' '' "File.write('$marker', 'loaded')" >"$payload"
  printf '%s\n' '# rubocop:disable Naming/FileName' '# frozen_string_literal: true' '' '# rubocop:enable Naming/FileName' >--require

  set +e
  ./run-rubocop.sh homebrew-taskforceai/--require "homebrew-taskforceai/$payload" >/dev/null 2>&1
  status=$?
  set -e

  if [ -f "$marker" ]; then
    marker_created=1
  fi

  rm -rf "$tmpdir"
  rm -f -- --require

  if [ "$marker_created" -eq 1 ]; then
    echo "run-rubocop.sh allowed filename option injection"
    exit 1
  fi

  if [ "$status" -ne 0 ]; then
    echo "run-rubocop.sh rejected legitimate file arguments after --"
    exit "$status"
  fi
}

test_rubocop_wrapper_rejects_option_injection
./run-rubocop.sh
