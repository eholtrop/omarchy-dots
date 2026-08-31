-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Omarchy's bootstrap keeps path setup out of this user config.
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

-- Disable all Omarchy default bindings. Add your own in hypr/bindings.lua.
-- omarchy_default_bindings = false
--
-- Or disable only bindings for Omarchy's preinstalled apps/web apps while
-- keeping core window-manager bindings:
-- omarchy_preinstalled_bindings = false

-- Load Omarchy defaults.
require("default.hypr.omarchy")

-- Put your personal overrides in these files. They're loaded after Omarchy's
-- defaults so package updates can improve the defaults without rewriting your
-- ~/.config/hypr files.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.windowrule")
require("hypr.autostart")

-- OBS WebSocket connection for streaming / recording automation.
hl.env("OBS_WEBSOCKET_URL", "obsws://10.0.59.83:4455/Nn5NSYpve4lRK4JN")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Power saving when idle (replaces the old hypridle listeners): once the
-- Omarchy screensaver has been up for a sustained spell (past the lock point),
-- turn off the keyboard backlight and the displays (DPMS). When the user
-- returns, omarchy-system-wake restores displays and backlight.
o.exec_on_start([[
( while true; do
    if hyprctl clients -j 2>/dev/null | grep -q '"class": "org.omarchy.screensaver"'; then
      first=$(cat /tmp/omarchy-idle-saver-since 2>/dev/null || date +%s)
      [ ! -e /tmp/omarchy-idle-saver-since ] && echo "$first" > /tmp/omarchy-idle-saver-since
      if [ $(( $(date +%s) - first )) -ge 45 ]; then
        omarchy-brightness-keyboard off >/dev/null 2>&1
        hyprctl dispatch 'hl.dsp.dpms({ action = "off" })' >/dev/null 2>&1
      fi
    else
      rm -f /tmp/omarchy-idle-saver-since
    fi
    sleep 5
  done ) &
]])
