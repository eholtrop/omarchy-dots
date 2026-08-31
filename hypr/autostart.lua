-- Extra autostart processes.
o.exec_on_start("uxplay -nh -n Omarchy -p")
o.exec_on_start("systemctl --user start hyprpolkitagent")
o.exec_on_start("screenkey")
