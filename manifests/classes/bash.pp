class bash {

    $BASHRC = "$PUPPET_DIR/files/home/bashrc"

    file {
        "/root/.bashrc":
            source => "$BASHRC",
            owner => root,
            group => root,
            mode => 644;
    }

    file { "$USER_DIR/.bashrc":
        source => "$BASHRC",
        owner => "$USER",
        group => "$USER",
        mode => 644;
    }

}
