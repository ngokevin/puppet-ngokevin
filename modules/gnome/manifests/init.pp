class gnome {
    package { "gnome-shell":
        ensure => latest;
    }

    package { "myunity":
        ensure => latest;
    }
}
