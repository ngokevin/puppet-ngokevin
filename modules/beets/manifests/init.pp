class beets {

    exec { "beets_clone":
        command => "git clone git@github.com:ngokevin/beets",
        cwd => "$USER_DIR/Code",
        returns => [0, 128],
        user => "$USER";
    }

    exec { "beets_install":
        command => "python setup.py install",
        cwd => "$USER_DIR/Code/beets",
        require => [
            Exec["beets_clone"]
        ],
        user => root;
    }

    file { "config":
        path => "$USER_DIR/.beetsconfig",
        source => "$PUPPET_DIR/modules/beets/files/home/beetsconfig",
        require => [
            Exec["beets_install"]
        ],
        owner => $USER, group=> $USER, mode => 644;
    }

}
