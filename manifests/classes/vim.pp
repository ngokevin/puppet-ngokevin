class vim {

    $VIMRC = "$PUPPET_DIR/files/etc/vim/vimrc"

    package { "vim":
        ensure => installed;
    }

    file { "/etc/vim/vimrc":
        require => Package["vim"],
        source => "$VIMRC",
        owner => root, group => root, mode => 644;
    }

    file { "/root/.vimrc":
        require => Package["vim"],
        source => "$VIMRC",
        owner => root, group => root, mode => 644;
    }

    file { "$USER_DIR/.vimrc":
        require => Package["vim"],
        source => "$VIMRC",
        owner => "$USER", group => "$USER", mode => 644;
    }

}
