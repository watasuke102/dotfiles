export GPG_TTY=${TTY}
export WSL_IP=$(grep nameserver /etc/resolv.conf | awk '{print $2}')
export PULSE_SERVER=tcp:${WSL_IP}
export DISPLAY=${WSL_IP}:0.0
[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || export QT_QPA_PLATFORMTHEME="qt5ct"

