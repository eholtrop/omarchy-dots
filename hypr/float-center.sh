#!/usr/bin/env bash
# Float the active window and centre it, or tile it again when it is already
# floating. Bound to CTRL + SUPER + ALT + DOWN in bindings.lua.
#
# Hyprland 0.56's centre dispatcher reports "No floating window found" even for
# a window that is genuinely floating, and omarchy-hyprland-window-pop defaults
# to a fixed 1300x900 that overflows a laptop panel. So the geometry is computed
# from the focused monitor and applied with resize + move instead.
#
# Usage: float-center.sh [percent-of-monitor], default 80.

set -uo pipefail

percent=${1:-80}

active=$(hyprctl activewindow -j) || exit 0
address=$(jq -r '.address' <<<"$active")
floating=$(jq -r '.floating' <<<"$active")

if [ -z "$address" ] || [ "$address" = "null" ]; then
  exit 0
fi

window="address:$address"

dispatch() {
  local lua=$1
  shift
  hyprctl dispatch "$lua" >/dev/null 2>&1 || hyprctl dispatch "$@" >/dev/null 2>&1
}

# A second press puts the window back into the layout.
if [ "$floating" = "true" ]; then
  dispatch "hl.dsp.window.float({ window = \"$window\", action = \"toggle\" })" \
    togglefloating "$window"
  exit 0
fi

read -r width height <<<"$(hyprctl monitors -j |
  jq -r '.[] | select(.focused) | "\(.width / .scale | floor) \(.height / .scale | floor)"')"

if [ -z "${width:-}" ] || [ -z "${height:-}" ]; then
  exit 0
fi

new_width=$((width * percent / 100))
new_height=$((height * percent / 100))
x=$(((width - new_width) / 2))
y=$(((height - new_height) / 2))

dispatch "hl.dsp.window.float({ window = \"$window\", action = \"toggle\" })" \
  togglefloating "$window"
dispatch "hl.dsp.window.resize({ window = \"$window\", x = $new_width, y = $new_height })" \
  resizeactive exact "$new_width" "$new_height" "$window"
dispatch "hl.dsp.window.move({ window = \"$window\", x = $x, y = $y })" \
  moveactive "$x" "$y" "$window"
