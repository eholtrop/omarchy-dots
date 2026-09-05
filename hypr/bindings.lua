-- Override defaults: unbind key combos we're repurposing.
hl.unbind("SUPER + SPACE")
hl.unbind("SUPER + W")
hl.unbind("SUPER + G")
hl.unbind("SUPER + S")
hl.unbind("SUPER + ALT + S")
hl.unbind("SUPER + SHIFT + LEFT")
hl.unbind("SUPER + SHIFT + RIGHT")
hl.unbind("SUPER + SHIFT + UP")
hl.unbind("SUPER + SHIFT + DOWN")
hl.unbind("ALT + TAB")
hl.unbind("ALT + SHIFT + TAB")
hl.unbind("CTRL + ALT + DELETE")
hl.unbind("SUPER + SHIFT + S")
hl.unbind("SUPER + X")
hl.unbind("SUPER + SHIFT + X")

-- Web app bindings.
o.bind("SUPER + SHIFT + A", "ChatGPT", { webapp = "https://chatgpt.com" })
o.bind("SUPER + SHIFT + ALT + A", "Grok", { webapp = "https://grok.com" })
o.bind("SUPER + SHIFT + C", "Calendar", { webapp = "https://app.hey.com/calendar/weeks/" })
o.bind("SUPER + SHIFT + E", "Email", { webapp = "https://app.hey.com" })
o.bind("SUPER + SHIFT + Y", "YouTube", { webapp = "https://youtube.com/" })
o.bind("SUPER + SHIFT + ALT + G", "WhatsApp", { webapp = "https://web.whatsapp.com/", focus = true })
o.bind("SUPER + SHIFT + CTRL + G", "Google Messages", { webapp = "https://messages.google.com/web/conversations", focus = true })
o.bind("SUPER + SHIFT + P", "Google Photos", { webapp = "https://photos.google.com/", focus = true })
o.bind("SUPER + SHIFT + X", "Excalidraw", { webapp = "https://excalidraw.com/" })

-- Menu / launcher.
o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu")
o.bind("CTRL + SPACE", "Launch apps", "omarchy-menu toggle apps")

-- Close window.
o.bind("CTRL + SHIFT + W", "Close window", hl.dsp.window.close())

-- Swap windows within a workspace.
o.bind("SUPER + ALT + LEFT", "Swap window to the left", hl.dsp.window.swap({ direction = "l" }))
o.bind("SUPER + ALT + RIGHT", "Swap window to the right", hl.dsp.window.swap({ direction = "r" }))
o.bind("SUPER + ALT + UP", "Swap window up", hl.dsp.window.swap({ direction = "u" }))
o.bind("SUPER + ALT + DOWN", "Swap window down", hl.dsp.window.swap({ direction = "d" }))

-- Move windows across monitors.
o.bind("CTRL + SUPER + ALT + LEFT", "Move window to previous monitor", hl.dsp.window.move({ monitor = "l" }))
o.bind("CTRL + SUPER + ALT + RIGHT", "Move window to next monitor", hl.dsp.window.move({ monitor = "r" }))

-- Focus workspaces.
o.bind("SUPER + A", "Focus workspace 1", hl.dsp.focus({ workspace = "1" }))
o.bind("SUPER + S", "Focus workspace 2", hl.dsp.focus({ workspace = "2" }))
o.bind("SUPER + S", "Hide blurry source", "~/.config/hypr/obs-main-monitor-blurry-set-visibility.sh 0")
o.bind("SUPER + D", "Focus workspace 3", hl.dsp.focus({ workspace = "3" }))
o.bind("SUPER + Q", "Focus workspace 4", hl.dsp.focus({ workspace = "4" }))
o.bind("SUPER + W", "Focus workspace 5", hl.dsp.focus({ workspace = "5" }))
o.bind("SUPER + W", "Hide blurry source", "~/.config/hypr/obs-main-monitor-blurry-set-visibility.sh 0")
o.bind("SUPER + E", "Focus workspace 6", hl.dsp.focus({ workspace = "6" }))
o.bind("SUPER + Z", "Focus workspace 7", hl.dsp.focus({ workspace = "7" }))
o.bind("SUPER + X", "Focus workspace 8", hl.dsp.focus({ workspace = "8" }))
o.bind("SUPER + X", "Hide blurry source", "~/.config/hypr/obs-main-monitor-blurry-set-visibility.sh 0")
o.bind("SUPER + C", "Focus workspace 9", hl.dsp.focus({ workspace = "9" }))
o.bind("SUPER + G", "Focus workspace gaming", hl.dsp.focus({ workspace = "10" }))
o.bind("SUPER + G", "Show blurry source", "~/.config/hypr/obs-main-monitor-blurry-set-visibility.sh 1")

-- Move windows to workspaces.
o.bind("SUPER + ALT + A", "Move window to workspace 1", hl.dsp.window.move({ workspace = "1" }))
o.bind("SUPER + ALT + S", "Move window to workspace 2", hl.dsp.window.move({ workspace = "2" }))
o.bind("SUPER + ALT + D", "Move window to workspace 3", hl.dsp.window.move({ workspace = "3" }))
o.bind("SUPER + ALT + Q", "Move window to workspace 4", hl.dsp.window.move({ workspace = "4" }))
o.bind("SUPER + ALT + W", "Move window to workspace 5", hl.dsp.window.move({ workspace = "5" }))
o.bind("SUPER + ALT + E", "Move window to workspace 6", hl.dsp.window.move({ workspace = "6" }))
o.bind("SUPER + ALT + Z", "Move window to workspace 7", hl.dsp.window.move({ workspace = "7" }))
o.bind("SUPER + ALT + X", "Move window to workspace 8", hl.dsp.window.move({ workspace = "8" }))
o.bind("SUPER + ALT + C", "Move window to workspace 9", hl.dsp.window.move({ workspace = "9" }))
o.bind("SUPER + ALT + G", "Move window to gaming workspace", hl.dsp.window.move({ workspace = "10" }))

-- Full screen / floating / center.
o.bind("CTRL + SUPER + ALT + UP", "Full width", hl.dsp.window.fullscreen({ mode = "maximized" }))
o.bind("CTRL + SUPER + ALT + DOWN", "Toggle floating", hl.dsp.window.float({ action = "toggle" }))
o.bind("CTRL + SUPER + ALT + DOWN", "Resize window", hl.dsp.exec_cmd("resizeactive exact 60% 75%"))
o.bind("CTRL + SUPER + ALT + DOWN", "Center window", hl.dsp.exec_cmd("centerwindow"))

-- Screenshot.
o.bind("SUPER + SHIFT + S", "Screenshot to clipboard", "grim -g \"$(slurp)\" - | wl-copy")

-- Push-to-talk (mouse:276 is a side button, e.g. Logitech MX Master).
-- o.bind("mouse:276", "PTT unmute", "pactl set-source-mute PTT_Output 1")
-- o.bind("mouse:276", "PTT mute", "pactl set-source-mute PTT_Output 0", { release = true })
-- o.exec_on_start("pactl set-source-mute PTT_Output 0")
