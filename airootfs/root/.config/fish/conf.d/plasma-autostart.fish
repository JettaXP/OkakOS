if test -z "$DISPLAY" -a -z "$WAYLAND_DISPLAY"; and test (tty) = "/dev/tty1"
    dbus-run-session startplasma-wayland
end
