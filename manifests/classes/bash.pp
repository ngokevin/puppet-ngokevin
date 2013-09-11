class bash {

    $BASHRC = "$PUPPET_DIR/files/home/bashrc"
    $BASHALIASES = "$PUPPET_DIR/files/home/bashaliases"

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

    file { "root_bashaliases":
        path => "/root/.bash_aliases",
        source => "$BASHALIASES",
        owner => root, group => root, mode => 644;
    }

    file { "user_bashaliases":
        path => "$USER_DIR/.bash_aliases",
        source => "$BASHALIASES",
        owner => "$USER", group => "$USER", mode => 644;
    }

}
