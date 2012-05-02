class firefox {
    package { "firefox":
        ensure  => latest;
    }

    file { "vimperatorrc":
        path => "$USER_DIR/.vimperatorrc",
        require => Package["firefox"],
        source => "$PUPPET_DIR/files/home/vimperatorrc",
        owner => "$USER", group=> "$USER", mode => 644;
    }
}
