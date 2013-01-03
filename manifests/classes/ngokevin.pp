class ngokevin {

    exec { "ngokevin_clone":
        command => "git clone git@github.com:ngokevin/ngokevin",
        cwd => "$USER_DIR/Code",
        returns => [0, 128],
        user => "$USER";
    }

    exec { "ngokevin_install":
        command => "wok",
        cwd => "$USER_DIR/Code/ngokevin",
        require => [
            Exec["ngokevin_clone"],
        ],
        user => "$USER";
    }

}
