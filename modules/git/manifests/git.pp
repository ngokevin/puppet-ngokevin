class git {

    package { "git":
        ensure => installed;
    }

    exec { "git_name":
        command => "git config --global User.name '$NAME'",
        require => Package["git"],
        cwd => "$USER_DIR",
        user => "$USER";
    }

    exec { "git_email":
        command => "git config --global User.email '$EMAIL'",
        require => Package["git"],
        cwd => "$USER_DIR",
        user => "$USER";
    }

    exec { "colors":
        command => "git config color.ui true",
        require => Package["git"],
        returns => [0, 255],
        cwd => "$USER_DIR",
        user => "$USER";
    }

    exec { "root_git_name":
        command => "git config --global User.name '$NAME'",
        require => Package["git"],
        cwd => "/",
        user => root;
    }

    exec { "root_git_email":
        command => "git config --global User.email '$EMAIL'",
        require => Package["git"],
        cwd => "/",
        user => root;
    }

    exec { "root_colors":
        command => "git config color.ui true",
        require => Package["git"],
        returns => [0, 255],
        cwd => "/",
        user => root;
    }

}
