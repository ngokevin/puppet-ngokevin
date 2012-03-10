class ngokevin {

    exec { "clone":
        command => "git clone git@github.com/ngokevin/ngokevin",
        cwd => "$USER_DIR/Code",
        user => "$USER";
    }

    exec { "install":
        command => "bash push",
        cwd => "$USER_DIR/Code/ngokevin",
        require => [
            Exec["clone"],
        ],
        user => root;
    }

}
