class power-button {
    exec {
        command => "gsettings set org.gnome.settings-daemon.plugins.power button-power 'hibernate'",
        user => "$USER";
    }
}
