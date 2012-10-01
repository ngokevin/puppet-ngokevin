class packages {

    package { "ssh":
        ensure => installed;
    }

    package { "weechat-curses":
        ensure => installed;
    }

}
