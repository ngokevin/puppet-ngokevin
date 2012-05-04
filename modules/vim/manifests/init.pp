class vim {

    $VIMRC = "$PUPPET_DIR/modules/vim/files/etc/vim/vimrc"

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

    file {"$USER_DIR/.vim":
        ensure => directory,
    }

    file {"$USER_DIR/.vim/ftdetect":
        ensure => directory,
        recurse => true,
        source => "$PUPPET_DIR/modules/vim/files/home/vim/ftdetect",
        owner => "$USER", group => "$USER", mode => 644;
    }

    file {"$USER_DIR/.vim/syntax":
        ensure => directory,
        recurse => true,
        source => "$PUPPET_DIR/modules/vim/files/home/vim/syntax",
        owner => "$USER", group => "$USER", mode => 644;
    }
}
