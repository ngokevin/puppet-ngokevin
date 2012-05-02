class ruby {
    package { "ruby":
        ensure => installed;
    }

    exec { "rubygems_clone":
        command => "git clone git@github.com:rubygems/rubygems",
        cwd => "$USER_DIR/Code",
        returns => [0, 128],
        user => "$USER";
    }

    exec { "rubygems_install":
        command => "ruby setup.rb",
        cwd => "$USER_DIR/Code/rubygems",
        require => [
            Exec["rubygems_clone"],
        ],
        user => root;
    }
}
