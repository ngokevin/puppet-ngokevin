class packages {

    package { "ssh":
        ensure => installed;
    }

    package { "weechat-curses":
        ensure => installed;
    }

    package { "nginx":
        ensure => installed;
    }

}
