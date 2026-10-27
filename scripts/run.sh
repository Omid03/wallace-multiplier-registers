#!/usr/bin/env bash
set -euo pipefail
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
experiment="${1:-wallace8}"
case "$experiment" in
  latch|dff|full_adder|cla16|wallace8|registered_top) ;;
  *) echo "Unknown experiment: $experiment" >&2; exit 1 ;;
esac
command -v hspice >/dev/null || { echo "hspice is not on PATH" >&2; exit 1; }
[[ -f "$repo_dir/models/mm018.l" ]] || { echo "Place mm018.l in models/" >&2; exit 1; }
mkdir -p "$repo_dir/runs/$experiment"
cd "$repo_dir/experiments/$experiment"
hspice -i circuit.sp -o "$repo_dir/runs/$experiment/circuit"
