class vim {

    $VIMRC = "$PUPPET_DIR/files/etc/vim/vimrc"

    package { "vim":
        ensure => installed;
    }

    file { "etc_vimrc":
        path => "/etc/vim/vimrc",
        require => Package["vim"],
        source => "$VIMRC",
        owner => root, group => root, mode => 644;
    }

    file { "root_vimrc":
        path => "/root/.vimrc",
        require => Package["vim"],
        source => "$VIMRC",
        owner => root, group => root, mode => 644;
    }

    file { "user_vimrc":
        path => "$USER_DIR/.vimrc",
        require => Package["vim"],
        source => "$VIMRC",
        owner => "$USER", group => "$USER", mode => 644;
    }

}
