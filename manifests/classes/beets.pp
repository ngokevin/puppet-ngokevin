class beets {

    exec { "clone":
        command => "git clone git@github.com/ngokevin/beets",
        cwd => "$USER_DIR/Code",
        user => "$USER";
    }

    exec { "install":
        command => "python setup.py install",
        cwd => "$USER_DIR/Code/beets",
        require => [
            Exec["clone"]
        ],
        user => root;
    }

    file { "config:
        path => "$USER_DIR/.beetsconfig",
        source => "$PUPPET_DIR/files/home/beetsconfig",
        require => [
            Exec["install']
        ],
        owner => $USER, group=> $USER, mode => 644;
    }

}
