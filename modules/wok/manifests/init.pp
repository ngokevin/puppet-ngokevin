class wok {
    exec { "wok_clone":
        command => "git clone git@github.com:mythmon/wok",
        cwd => "$USER_DIR/Code",
        returns => [0, 128],
        user => "$USER";
    }

    exec { "wok_install":
        command => "python setup.py install",
        cwd => "$USER_DIR/Code/wok",
        require => [
            Exec["wok_clone"],
        ],
        user => root;
    }
}
