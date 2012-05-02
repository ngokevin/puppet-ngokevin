class bash {

    $BASHRC = "$PUPPET_DIR/modules/bash/files/home/bashrc"

    file { "root_bashrc":
        path => "/root/.bashrc",
        source => "$BASHRC",
        owner => root, group => root, mode => 644;
    }

    file { "user_bashrc":
        path => "$USER_DIR/.bashrc",
        source => "$BASHRC",
        owner => "$USER", group => "$USER", mode => 644;
    }

}
