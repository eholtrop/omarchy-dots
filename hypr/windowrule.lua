-- Force specific workspaces.
o.window("BambuStudio", { workspace = "5" })
o.window("^(com.core447.StreamController)$", { workspace = "6" })
o.window("^(jetbrains-studio)$", { workspace = "2" })
o.window("^(YoutubeMusic)$", { workspace = "3" })

-- Games launch on workspace 10.
o.window("^(lutris)$", { workspace = "10" })
o.window("^(heroic)$", { workspace = "10" })
o.window("^(steam)$", { workspace = "10" })
o.window("^(steam_app_.*)$", { workspace = "10" })
o.window("^(one.alynx.showmethekey)$", { workspace = "6" })

-- stream chat and obs on workspace 4
o.window("^(socialstream)$", { workspace = "1" })
o.window("^(com.obsproject.Studio)$", { workspace = "1" })

-- Floating windows.
o.window({ title = "^(lazygit)$" }, { float = true, size = { "monitor_w * 0.6", "monitor_h * 0.6" } })
o.window("^(org.gnome.Nautilus)$", { float = true })
o.window("^(screenkey)$", { float = true, size = { 800, 100 }, workspace = "6 silent" })

-- Force Excalidraw webapp to float.
o.window("^(excalidraw)$", { float = true })
