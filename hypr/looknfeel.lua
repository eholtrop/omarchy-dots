-- Change the default Omarchy look'n'feel.

-- Bind workspaces to monitors.
hl.workspace_rule({ workspace = "1", monitor = "DP-1", layout = "dwindle" })
hl.workspace_rule({ workspace = "4", monitor = "DP-1", layout = "dwindle" })
hl.workspace_rule({ workspace = "7", monitor = "DP-1", layout = "dwindle" })
hl.workspace_rule({ workspace = "2", monitor = "DP-2", layout = "dwindle" })
hl.workspace_rule({ workspace = "5", monitor = "DP-2", layout = "dwindle" })
hl.workspace_rule({ workspace = "8", monitor = "DP-2", layout = "dwindle" })
hl.workspace_rule({ workspace = "10", monitor = "DP-2", layout = "dwindle" })
hl.workspace_rule({ workspace = "3", monitor = "DP-3", layout = "dwindle" })
hl.workspace_rule({ workspace = "6", monitor = "DP-3", layout = "dwindle" })
hl.workspace_rule({ workspace = "9", monitor = "DP-3", layout = "dwindle" })

-- Master layout configuration.
hl.config({
  master = {
    new_status = "slave",
    orientation = "left",
    center_master_fallback = "left",
    slave_count_for_center_master = 3,
    new_on_top = true,
  },
})

-- Window rounding.
hl.config({
  decoration = {
    rounding = 8,
  },
})
