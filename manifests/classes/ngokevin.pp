class ngokevin {

    exec { "ngokevin_clone":
        command => "git clone git@github.com:ngokevin/osuaiaa",
        cwd => "$USER_DIR",
        returns => [0, 128],
        user => "$USER";
    }

    exec { "ngokevin_install":
        command => "wok",
        cwd => "$USER_DIR/osuaiaa",
        require => [
            Exec["ngokevin_clone"],
        ],
        user => root;
    }

}
