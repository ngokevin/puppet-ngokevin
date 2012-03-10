class wok {

    exec { "clone":
        command => "git clone git@github.com/mythmon/wok",
        cwd => "$USER_DIR/Code",
        user => "$USER";
    }

    exec { "install":
        command => "python setup.py install",
        cwd => "$USER_DIR/Code/wok",
        require => [
            Exec["clone"],
        ],
        user => root;
    }

}
